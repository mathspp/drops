---
themes:
    - "`pathlib`"
    - "filesystem"
    - "`pathlib.Path.is_file`"
    - "`pathlib.Path.iterdir`"
---

(133)=
# 133 – Find files in a directory

You can use `pathlib.Path` together with the methods `iterdir` and `is_file` to find and list all files inside a directory:

```py
from pathlib import Path

directory = Path("path/to/dir")
files = [p for p in directory.iterdir() if p.is_file()]
```

The method `iterdir` finds all directory contents but won't recurse into subdirectories and then `is_file` filters out anything that's not a file.
You could replace it with `is_dir` to get all directories instead.

This is more robust that using something like `glob(*.*)` because files don't always have dots in their names.
