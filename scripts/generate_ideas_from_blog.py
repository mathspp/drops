#!/usr/bin/env python3
# /// script
# requires-python = ">=3.14"
# dependencies = [
#   "click",
# ]
# ///
from __future__ import annotations

import json
import re
import subprocess
import tempfile
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Iterable

import click

SHORT_THRESHOLD = 800
LONG_THRESHOLD = 2500
FAILED_SLUGS_SEPARATOR = ", "
ARTICLE_HEADING_RE = re.compile(r"^##\s+(.+)$", re.MULTILINE)
PUBLISHED_FALSE_RE = re.compile(r"^published:\s*false\b", re.MULTILINE)
PYTHON_TAG_RE = re.compile(r"^\s*-\s*python\s*$", re.MULTILINE)
DROPS_TOPIC_DIR_RE = re.compile(r"^\d{4}-(.+)$")


@dataclass(frozen=True)
class Article:
    slug: str
    item_file: Path
    words: int
    length_class: str
    ideas_n: int


def _word_count(text: str) -> int:
    return len(text.split())


def classify_article(word_count: int) -> tuple[str, int]:
    if word_count >= LONG_THRESHOLD:
        return "long", 5
    if word_count >= SHORT_THRESHOLD:
        return "medium", 3
    return "short", 1


def discover_item_files(blog_root: Path) -> list[Path]:
    results: list[Path] = []
    for path in sorted(blog_root.rglob("item.md")):
        try:
            depth = len(path.relative_to(blog_root).parts)
        except ValueError:
            continue
        if depth in (2, 3):
            results.append(path)
    return results


def extract_processed_slugs(output_file: Path) -> set[str]:
    if not output_file.exists() or output_file.stat().st_size == 0:
        return set()
    text = output_file.read_text(encoding="utf-8")
    return {m.group(1).strip() for m in ARTICLE_HEADING_RE.finditer(text)}


def collect_existing_topics(cwd: Path) -> list[str]:
    topics: list[str] = []
    for child in sorted(cwd.iterdir()):
        if not child.is_dir():
            continue
        match = DROPS_TOPIC_DIR_RE.match(child.name)
        if match:
            topics.append(match.group(1))
    return sorted(set(topics))


def select_articles(
    blog_root: Path, *, resume: bool, output_file: Path
) -> list[Article]:
    processed_slugs = extract_processed_slugs(output_file) if resume else set()
    selected: list[Article] = []

    for item_file in discover_item_files(blog_root):
        fm = item_file.parent / "frontmatter.yaml"
        if not fm.exists():
            continue

        frontmatter = fm.read_text(encoding="utf-8")
        if PUBLISHED_FALSE_RE.search(frontmatter):
            continue
        if not PYTHON_TAG_RE.search(frontmatter):
            continue

        slug = item_file.parent.name
        if slug in processed_slugs:
            continue

        body = item_file.read_text(encoding="utf-8")
        words = _word_count(body)
        length_class, ideas_n = classify_article(words)
        selected.append(
            Article(
                slug=slug,
                item_file=item_file,
                words=words,
                length_class=length_class,
                ideas_n=ideas_n,
            )
        )

    return selected


def make_prompt(
    article: Article, article_body: str, existing_topics: Iterable[str]
) -> str:
    topics = ",".join(existing_topics)
    return f"""You are generating ideas for short Python tips in the style of concise daily tips.

Return ONLY a JSON array of strings and nothing else.
The array must contain exactly {article.ideas_n} items.
Each item must be a concrete idea for one short Python tip derived from the source article.
Each idea must be specific and actionable.
Avoid ideas that directly duplicate these existing drops topics:
{topics}

Article slug: {article.slug}
Article length class: {article.length_class}
Article word count: {article.words}

Source article content starts below:
-----
{article_body}
-----
"""


def make_retry_prompt(article: Article, article_body: str) -> str:
    return f"""Return ONLY strict JSON.
Output must be exactly a JSON array with exactly {article.ideas_n} non-empty strings.
No markdown. No explanations. No preface.

Generate short Python tip ideas derived from this article:
-----
{article_body}
-----
"""


def validate_codex_output(
    out_file: Path, expected: int
) -> tuple[bool, list[str] | None, str | None]:
    raw = out_file.read_text(encoding="utf-8").strip() if out_file.exists() else ""
    try:
        data = json.loads(raw)
    except json.JSONDecodeError:
        preview = raw.replace("\n", " ")[:160] or "<empty>"
        return False, None, f"validation_failed(exit=2, output_preview={preview})"

    if not isinstance(data, list) or len(data) != expected:
        preview = raw.replace("\n", " ")[:160] or "<empty>"
        return False, None, f"validation_failed(exit=3, output_preview={preview})"

    if any((not isinstance(item, str) or not item.strip()) for item in data):
        preview = raw.replace("\n", " ")[:160] or "<empty>"
        return False, None, f"validation_failed(exit=4, output_preview={preview})"

    ideas = [item.strip() for item in data]
    return True, ideas, None


def run_codex_exec(prompt: str, out_file: Path, cwd: Path) -> tuple[bool, int, str]:
    result = subprocess.run(
        ["codex", "exec", "-C", str(cwd), "-o", str(out_file), "-"],
        input=prompt,
        text=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        check=False,
    )
    return result.returncode == 0, result.returncode, ""


def append_run_header(output_file: Path, timestamp: str) -> None:
    with output_file.open("a", encoding="utf-8") as fh:
        fh.write(f"\n# Idea Generation Run ({timestamp})\n\n")


def append_article(output_file: Path, article: Article, ideas: list[str]) -> None:
    with output_file.open("a", encoding="utf-8") as fh:
        fh.write(f"## {article.slug}\n")
        fh.write(f"- Source: `{article.item_file}`\n")
        fh.write(f"- Length: `{article.length_class}` ({article.words} words)\n")
        fh.write("- Ideas:\n")
        for idx, idea in enumerate(ideas, start=1):
            fh.write(f"{idx}. {idea}\n")
        fh.write("\n")


def append_run_summary(
    output_file: Path,
    *,
    selected: int,
    succeeded: int,
    failed: int,
    retries: int,
    failed_slugs: list[str],
) -> None:
    with output_file.open("a", encoding="utf-8") as fh:
        fh.write("## Run summary\n")
        fh.write(f"- Selected: {selected}\n")
        fh.write(f"- Succeeded: {succeeded}\n")
        fh.write(f"- Failed: {failed}\n")
        fh.write(f"- Retries used: {retries}\n")
        if failed_slugs:
            fh.write(f"- Failed slugs: {FAILED_SLUGS_SEPARATOR.join(failed_slugs)}\n")
        fh.write("\n")


@click.command(context_settings={"help_option_names": ["-h", "--help"]})
@click.option(
    "--blog-root",
    type=click.Path(path_type=Path, file_okay=False, dir_okay=True, resolve_path=True),
    default=lambda: Path.home()
    / "Documents"
    / "mathspp"
    / "mathspp"
    / "pages"
    / "02.blog",
    show_default="~/Documents/mathspp/mathspp/pages/02.blog",
    help="Blog root directory.",
)
@click.option(
    "--output",
    type=click.Path(path_type=Path, dir_okay=False, resolve_path=False),
    default=Path(".IDEAS.md"),
    show_default=True,
    help="Output file to append ideas to.",
)
@click.option(
    "--limit",
    type=click.IntRange(min=0),
    default=0,
    show_default=True,
    help="Maximum number of articles to process (0 = no limit).",
)
@click.option(
    "--resume", is_flag=True, help="Skip articles already present in the output file."
)
@click.option(
    "--dry-run",
    is_flag=True,
    help="Show what would run without calling codex exec or writing output.",
)
def cli(blog_root: Path, output: Path, limit: int, resume: bool, dry_run: bool) -> None:
    """Generate short Python tip ideas from blog articles."""

    if not blog_root.is_dir():
        raise click.ClickException(f"Blog root does not exist: {blog_root}")

    output.parent.mkdir(parents=True, exist_ok=True)
    output.touch(exist_ok=True)

    selected = select_articles(blog_root, resume=resume, output_file=output)
    total_selected = len(selected)
    if total_selected == 0:
        click.echo("No matching articles found.")
        return

    if limit > 0:
        selected = selected[:limit]

    run_count = len(selected)
    click.echo(
        f"Selected {total_selected} articles; processing {run_count} article(s)."
    )

    if dry_run:
        click.echo("Dry run enabled. Listing selected articles:")
        for idx, article in enumerate(selected, start=1):
            line = f"{article.slug},{article.item_file},{article.words},{article.length_class},{article.ideas_n}"
            click.echo(f"{idx:6}\t{line}")
        return

    persistent_failure_log = Path(".ideas.log")
    persistent_failure_log.touch(exist_ok=True)
    run_started_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    append_run_header(output, run_started_at)

    existing_topics = collect_existing_topics(Path.cwd())

    success = 0
    failed = 0
    retries = 0
    failed_slugs: list[str] = []

    with tempfile.TemporaryDirectory() as tmp:
        tmp_dir = Path(tmp)

        for index, article in enumerate(selected, start=1):
            click.echo(
                f"[{index}/{run_count}] Generating ideas for {article.slug} "
                f"({article.length_class}, {article.words} words, {article.ideas_n} ideas)"
            )

            article_body = article.item_file.read_text(encoding="utf-8")
            out_file = tmp_dir / f"{article.slug}.out.txt"
            prompt = make_prompt(article, article_body, existing_topics)

            run_ok = False
            failure_reason = "unknown"
            validated_ideas: list[str] | None = None

            for attempt in (1, 2):
                ok, exit_code, _stderr = run_codex_exec(prompt, out_file, Path.cwd())
                if ok:
                    valid, ideas, reason = validate_codex_output(
                        out_file, article.ideas_n
                    )
                    if valid:
                        run_ok = True
                        validated_ideas = ideas
                        break
                    output_preview = "<empty>"
                    if out_file.exists():
                        output_preview = (
                            out_file.read_text(encoding="utf-8").replace("\n", " ")[
                                :160
                            ]
                            or "<empty>"
                        )
                    base_reason = reason or "validation_failed"
                    if base_reason.endswith(")"):
                        failure_reason = base_reason[:-1] + f", attempt={attempt})"
                    else:
                        failure_reason = f"{base_reason}(attempt={attempt}, output_preview={output_preview})"
                else:
                    failure_reason = (
                        f"codex_exec_failed(exit={exit_code}, attempt={attempt})"
                    )

                if attempt == 1:
                    retries += 1
                    prompt = make_retry_prompt(article, article_body)

            if run_ok and validated_ideas is not None:
                append_article(output, article, validated_ideas)
                success += 1
            else:
                failed += 1
                failed_slugs.append(article.slug)
                with persistent_failure_log.open("a", encoding="utf-8") as log_fh:
                    log_fh.write(
                        f"[{run_started_at}] slug={article.slug} words={article.words} "
                        f"length={article.length_class} ideas={article.ideas_n} "
                        f"source={article.item_file} reason={failure_reason}\n"
                    )

    append_run_summary(
        output,
        selected=run_count,
        succeeded=success,
        failed=failed,
        retries=retries,
        failed_slugs=failed_slugs,
    )

    click.echo(f"Done. Success: {success}, Failed: {failed}, Retries: {retries}")
    if failed_slugs:
        click.echo(f"Failed slugs: {FAILED_SLUGS_SEPARATOR.join(failed_slugs)}")


if __name__ == "__main__":
    cli()
