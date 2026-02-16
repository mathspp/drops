#!/usr/bin/env bash
set -euo pipefail

BLOG_ROOT="$HOME/Documents/mathspp/mathspp/pages/02.blog"
OUTPUT_FILE=".IDEAS.md"
LIMIT=0
RESUME=false
DRY_RUN=false

usage() {
  cat <<USAGE
Usage: scripts/generate_ideas_from_blog.sh [options]

Options:
  --blog-root PATH   Blog root directory (default: ~/Documents/mathspp/mathspp/pages/02.blog)
  --output PATH      Output file to append ideas to (default: .IDEAS.md)
  --limit N          Maximum number of articles to process (default: 0 = no limit)
  --resume           Skip articles already present in output file
  --dry-run          Show what would run without calling codex exec or writing output
  -h, --help         Show this help
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --blog-root)
      BLOG_ROOT="$2"
      shift 2
      ;;
    --output)
      OUTPUT_FILE="$2"
      shift 2
      ;;
    --limit)
      LIMIT="$2"
      shift 2
      ;;
    --resume)
      RESUME=true
      shift
      ;;
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if ! [[ "$LIMIT" =~ ^[0-9]+$ ]]; then
  echo "--limit must be a non-negative integer." >&2
  exit 1
fi

if [[ ! -d "$BLOG_ROOT" ]]; then
  echo "Blog root does not exist: $BLOG_ROOT" >&2
  exit 1
fi

mkdir -p "$(dirname "$OUTPUT_FILE")"
touch "$OUTPUT_FILE"

tmp_dir="$(mktemp -d)"
cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

selected_csv="$tmp_dir/selected.csv"
processed_slugs="$tmp_dir/processed_slugs.txt"
existing_topics="$tmp_dir/existing_topics.txt"

: > "$selected_csv"
: > "$processed_slugs"

if [[ "$RESUME" == true && -s "$OUTPUT_FILE" ]]; then
  rg '^## ' "$OUTPUT_FILE" | sed 's/^## //' > "$processed_slugs" || true
fi

# Collect existing drops topics to reduce idea duplication.
find . -maxdepth 1 -mindepth 1 -type d -exec basename {} \; \
  | rg '^[0-9]{4}-' \
  | sed -E 's/^[0-9]{4}-//' \
  | sort -u > "$existing_topics"

# Discover item.md files at depth 2 or 3 from blog root.
# Keep only published + python-tagged posts.
while IFS= read -r item_file; do
  dir="$(dirname "$item_file")"
  fm="$dir/frontmatter.yaml"

  [[ -f "$fm" ]] || continue

  if rg -q '^published:\s*false\b' "$fm"; then
    continue
  fi

  if ! rg -q '^\s*-\s*python\s*$' "$fm"; then
    continue
  fi

  slug="$(basename "$dir")"

  if [[ "$RESUME" == true ]] && rg -qx "$slug" "$processed_slugs"; then
    continue
  fi

  words="$(wc -w < "$item_file" | tr -d ' ')"

  length_class="short"
  ideas_n=1
  if (( words >= 2500 )); then
    length_class="long"
    ideas_n=5
  elif (( words >= 800 )); then
    length_class="medium"
    ideas_n=3
  fi

  printf '%s,%s,%s,%s,%s\n' "$slug" "$item_file" "$words" "$length_class" "$ideas_n" >> "$selected_csv"
done < <(find "$BLOG_ROOT" -mindepth 2 -maxdepth 3 -type f -name item.md | sort)

total_selected="$(wc -l < "$selected_csv" | tr -d ' ')"
if (( total_selected == 0 )); then
  echo "No matching articles found."
  exit 0
fi

if (( LIMIT > 0 )); then
  head -n "$LIMIT" "$selected_csv" > "$tmp_dir/limited.csv"
  mv "$tmp_dir/limited.csv" "$selected_csv"
fi

run_count="$(wc -l < "$selected_csv" | tr -d ' ')"
echo "Selected $total_selected articles; processing $run_count article(s)."

if [[ "$DRY_RUN" == true ]]; then
  echo "Dry run enabled. Listing selected articles:"
  nl -ba "$selected_csv"
  exit 0
fi

success=0
failed=0
retries=0
failure_log="$tmp_dir/failures.log"
: > "$failure_log"

# Appended run header.
{
  printf '\n# Idea Generation Run (%s)\n\n' "$(date '+%Y-%m-%d %H:%M:%S')"
} >> "$OUTPUT_FILE"

index=0
while IFS=',' read -r slug item_file words length_class ideas_n; do
  index=$((index + 1))
  echo "[$index/$run_count] Generating ideas for $slug ($length_class, $words words, $ideas_n ideas)"

  article_body="$tmp_dir/${slug}.body.md"
  prompt_file="$tmp_dir/${slug}.prompt.txt"
  out_file="$tmp_dir/${slug}.out.txt"

  cp "$item_file" "$article_body"

  cat > "$prompt_file" <<PROMPT
You are generating ideas for short Python tips in the style of concise daily tips.

Return ONLY a JSON array of strings and nothing else.
The array must contain exactly $ideas_n items.
Each item must be a concrete idea for one short Python tip derived from the source article.
Each idea must be specific and actionable.
Avoid ideas that directly duplicate these existing drops topics:
$(tr '\n' ',' < "$existing_topics" | sed 's/,$//')

Article slug: $slug
Article length class: $length_class
Article word count: $words

Source article content starts below:
-----
$(cat "$article_body")
-----
PROMPT

  run_ok=false
  for attempt in 1 2; do
    if codex exec -C "$PWD" -o "$out_file" - < "$prompt_file" >/dev/null 2>&1; then
      if python3 - "$out_file" "$ideas_n" > "$tmp_dir/${slug}.validated.txt" <<'PY'
import json
import sys

path = sys.argv[1]
expected = int(sys.argv[2])
raw = open(path, 'r', encoding='utf-8').read().strip()

try:
    data = json.loads(raw)
except json.JSONDecodeError:
    sys.exit(2)

if not isinstance(data, list) or len(data) != expected:
    sys.exit(3)

for item in data:
    if not isinstance(item, str) or not item.strip():
      sys.exit(4)

for i, item in enumerate(data, start=1):
    print(f"{i}. {item.strip()}")
PY
      then
        run_ok=true
        break
      fi
    fi

    if (( attempt == 1 )); then
      retries=$((retries + 1))
      cat > "$prompt_file" <<PROMPT_RETRY
Return ONLY strict JSON.
Output must be exactly a JSON array with exactly $ideas_n non-empty strings.
No markdown. No explanations. No preface.

Generate short Python tip ideas derived from this article:
-----
$(cat "$article_body")
-----
PROMPT_RETRY
    fi
  done

  if [[ "$run_ok" == true ]]; then
    {
      printf '## %s\n' "$slug"
      printf -- '- Source: `%s`\n' "$item_file"
      printf -- '- Length: `%s` (%s words)\n' "$length_class" "$words"
      printf -- '- Ideas:\n'
      cat "$tmp_dir/${slug}.validated.txt"
      printf '\n'
    } >> "$OUTPUT_FILE"
    success=$((success + 1))
  else
    echo "$slug" >> "$failure_log"
    failed=$((failed + 1))
  fi
done < "$selected_csv"

{
  printf '## Run summary\n'
  printf -- '- Selected: %s\n' "$run_count"
  printf -- '- Succeeded: %s\n' "$success"
  printf -- '- Failed: %s\n' "$failed"
  printf -- '- Retries used: %s\n' "$retries"
  if [[ -s "$failure_log" ]]; then
    printf -- '- Failed slugs: %s\n' "$(paste -sd ', ' "$failure_log")"
  fi
  printf '\n'
} >> "$OUTPUT_FILE"

echo "Done. Success: $success, Failed: $failed, Retries: $retries"
if [[ -s "$failure_log" ]]; then
  echo "Failed slugs: $(paste -sd ', ' "$failure_log")"
fi
