#!/usr/bin/env python3
from __future__ import annotations

import re
from pathlib import Path

PREFIX_RE = re.compile(r"(^\d+).+")


def toc_path(p: Path) -> str:
    return p.with_suffix("").as_posix()


def pick_md_in_folder(folder: Path) -> Path | None:
    preferred = folder / f"{folder.name}.md"
    if preferred.is_file():
        return preferred
    md_files = sorted(folder.glob("*.md"), key=lambda x: x.name)
    return md_files[0] if md_files else None


def prefix_num(name: str) -> int:
    return PREFIX_RE.match(name).group(1)


def main() -> None:
    root = Path(".")
    items = [p for p in root.iterdir() if PREFIX_RE.match(p.name)]
    items.sort(key=lambda p: (prefix_num(p.name), p.name))

    chapters: list[str] = []
    for p in items:
        if p.is_file():
            chapters.append(toc_path(p))
        elif p.is_dir():
            md = pick_md_in_folder(p)
            if md:
                chapters.append(toc_path(md))

    toc_text = "\n".join(
        [
            "# Table of contents",
            "# Learn more at https://jupyterbook.org/customize/toc.html",
            "",
            "format: jb-book",
            f"root: {chapters[0]}",
            "options:",
            "  numbered: false",
            "chapters:",
            *[f"- file: {ch}" for ch in chapters[1:]],
            "",
        ]
    )

    Path("_toc.yml").write_text(toc_text, encoding="utf-8")


if __name__ == "__main__":
    main()
