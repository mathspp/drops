# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "pyperclip",
# ]
# ///

from pathlib import Path
import re

import pyperclip

TITLE_PATTERN = re.compile(r"(?m)^## (?P<nr>\d{1,4}) – (?P<title>.*)$")
CODE_PATTERN = re.compile("`(.*?)`")

def to_code(title: str) -> str:
    def repl(match: re.Match) -> str:
        return f"<code>{match.group(1)}</code>"

    return CODE_PATTERN.sub(repl, title)

if __name__ == "__main__":
    titles: list[tuple[int, str]] = []
    for tip in Path(".").rglob("**/tip.md"):
        contents = tip.read_text()
        if (match := TITLE_PATTERN.search(contents)):
            titles.append(
                (int(match.group("nr")), match.group("title"))
            )

    html_lines = ["<ol reversed>"]
    for nr, title in sorted(titles, reverse=True):
        html_lines.append(f"    <li>{to_code(title)}</li>")
    html_lines.append("</ol>")
    html = "\n".join(html_lines)
    pyperclip.copy(html)
    print("HTML list copied to clipboard. ✨")
