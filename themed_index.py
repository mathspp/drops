# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "ruamel-yaml",
# ]
# ///
from pathlib import Path
import re
from collections import defaultdict
import string
from ruamel.yaml import YAML


# Initialize
yaml = YAML()
theme_to_references = defaultdict(list)

# Find all `tip.md` files
tip_files = list(Path(".").glob("[0-9][0-9][0-9][0-9]*/tip.md"))

# Regex patterns
frontmatter_pattern = re.compile(r"^---\n(.*?)\n---", re.DOTALL | re.MULTILINE)
heading_pattern = re.compile(r"^#\s+(\d+)\s+–\s+(.*)", re.MULTILINE)

# Parse each file
for file in tip_files:
    content = file.read_text(encoding="utf-8")

    # Extract frontmatter
    frontmatter_match = frontmatter_pattern.search(content)
    if not frontmatter_match:
        continue  # Skip files without frontmatter
    frontmatter_text = frontmatter_match.group(1)
    frontmatter = yaml.load(frontmatter_text)

    # Extract first heading
    heading_match = heading_pattern.search(content)
    if not heading_match:
        continue  # Skip files without correct heading
    number = heading_match.group(1)
    title = heading_match.group(2)

    # Extract themes
    themes = frontmatter.get("themes", [])
    for theme in themes:
        theme_to_references[theme].append((int(number), title))

# Group themes by first character
grouped = defaultdict(list)
for theme, references in theme_to_references.items():
    first_char = theme[0].upper() if theme[0] != "`" else theme[1].upper()
    if first_char in string.ascii_uppercase:
        group_key = first_char
    elif first_char == "_":
        group_key = "`_`"
    else:
        group_key = "`#`"
    grouped[group_key].append((theme, references))

# Sort the groups
sorted_groups = sorted(grouped.items(), key=lambda x: (x[0] != "`#`", x[0]))
output_lines = ["# Themed index\n"]

for group_key, themes in sorted_groups:
    output_lines.append(f"## {group_key}\n")
    # Sort themes alphabetically
    for theme, references in sorted(themes, key=lambda x: x[0].lower().lstrip("`")):
        # Sort references by number
        references_sorted = sorted(references, key=lambda x: x[0])
        links = ", ".join(f"[{num}]({num})" for num, _ in references_sorted)
        output_lines.append(f"- {theme}: {links}")
    output_lines.append("")  # Blank line between groups

# Write the final output
output_path = Path("9998.themed-index.md")
output_path.write_text("\n".join(output_lines), encoding="utf-8")

print(f"Generated themed index at {output_path.resolve()}")
