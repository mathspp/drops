# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "rich",
# ]
# ///

from pathlib import Path
from rich import print
from rich.progress import track


def main() -> None:
    for img in track(Path(__file__).parent.glob("*.png"), transient=True):
        dirname = Path(img.stem.removeprefix("drops-").replace("_", "-", 1))
        dirname.mkdir()
        (dirname / "tip.md").touch()
        new_image_name = str(img.name).removeprefix("drops-").replace("_", "-", 1)
        img.rename(dirname / new_image_name)
    print("✨ Done!")


if __name__ == "__main__":
    main()
