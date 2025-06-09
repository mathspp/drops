---
themes:
    - "filesystem"
    - "`pathlib`"
    - "`pathlib.Path.glob`"
---

## 71 – File discovery by name pattern

When you need to find files based on a name pattern, you can use the method `glob` from `pathlib.Path`.
Note that `glob` doesn't support complex (regex) patterns, though.

Suppose the filesystem contains the following folder `Downloads` and its given contents:

```txt
📂 Downloads/
  - cat_and_dog.png
  - cute_cat.jpg
  - cute_dog.jpg
  - two_cats.png
```

Then, the snippet below finds all files with the string “cat” in the name:

```py
from pathlib import Path

cat_files = Path("Downloads").glob("*cat*")
# Finds cat_and_dog.png, cute_cat.jpg, two_cats.png
```

Similarly, the snippet below finds all files that end with “.jpg”:

```py
from pathlib import Path

jpg_imgs = Path("Downloads").glob("*.jpg")
# Finds cute_cat.jpg, cute_dog.jpg
```

Note that the method `glob` produces the file paths in an arbitrary order.

Further reading:

 - [Module `pathlib` overview](https://mathspp.com/blog/module-pathlib-overview).
