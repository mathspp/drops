---
themes:
    - "`key` (keyword argument)"
    - "standard library"
    - "`pathlib`"
    - "`pathlib.Path.iterdir`"
    - "`pathlib.Path.isfile`"
    - "`pathlib.Path.stat`"
    - "`pathlib.Path.rglob`"
---

(32)=
# 32 – Most recently-modified file

Due to flexibility of the built-in `max`, it takes one single line of code to find the most recently-modified file in a directory:

```py
from pathlib import Path

folder_to_search = Path("/path/to/folder")
most_recent = max(folder.iterdir(), key=lambda p: p.stat().st_mtime)
print(most_recent)  # /path/to/folder/some_file.txt
```

This works by using the method `stat` that provides access to file statistics and then using the attribute `st_mtime` that contains the time of the last file modification.

This line of code is highly flexible!

Do you want to skip directories and only consider files?
In that case, filter with a generator expression:

```py
most_recent = max(
    (p for p in folder.iterdir() if p.is_file()),
    key=lambda p: p.stat().st_mtime,
)
```

Do you want the search to be recursive?
Then, use `folder.rglob(*)` instead of `folder.iterdir()`.
