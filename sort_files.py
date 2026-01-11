#!/usr/bin/env -S uv run
# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "rich",
# ]
# ///

from pathlib import Path
from rich import print
from rich.progress import track


TIP_TEMPLATE = """\
---
themes:
    - ""
---

({num})=
# {num} – Title
"""


def main() -> None:
    for img in track(Path(__file__).parent.glob("*.png"), transient=True):
        dirname = Path(img.stem.removeprefix("drops-").replace("_", "-", 1))
        dirname.mkdir()
        number, _ = str(dirname).split("-", 1)
        tip_file = dirname / "tip.md"
        tip_file.touch()
        tip_file.write_text(TIP_TEMPLATE.format(num=number.lstrip("0")))
        new_image_name = str(img.name).removeprefix("drops-").replace("_", "-", 1)
        img.rename(dirname / new_image_name)
    print("✨ Done!")


if __name__ == "__main__":
    main()
