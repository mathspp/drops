---
themes:
    - "standard library"
    - "`pathlib`"
    - "`pathlib.Path.expanduser`"
    - "`pathlib.Path.resolve`"
    - "filesystem"
---

(64)=
# 64 – Resolving paths

When working with paths, and especially if user input is involved, you often want to normalise and resolve your paths so you have absolute paths that are expanded.

For example, you might need to turn

 - something `"~/Documents"` into `"/Users/rodrigogs/Documents"` (or whatever the equivalent is in your OS); or
 - something like `"~/Documents/../Downloads"` into `"/Users/rodrigogs/Downloads"`, getting rid of the `~` and the `..`.

To expand the `~` into your home folder, use the method `expanduser`:

```py
from pathlib import Path

docs = Path("~/Documents")
abs_docs = docs.expanduser()
print(abs_docs)  # /Users/rodrigogs/Documents
```

To resolve references with `..` or `.`, use the method `resolve`:

```py
downloads = abs_docs / ".." / "Downloads"
print(downloads)  # /Users/rodrigogs/Documents/../Downloads
print(downloads.resolve())  # /Users/rodrigogs/Downloads
```

To do everything in one go, use `Path(filepath).expanduser().resolve()`.
And make sure you call `expanduser` first, since calling `resolve` first might lead to the wrong result:

```py
downloads = docs / ".." / "Downloads"
print(downloads)  # ~/Documents/../Downloads

# Correct order:
print(downloads.expanduser().resolve())  # /Users/rodrigogs/Downloads

# Wrong order:
print(downloads.resolve().expanduser())  # /Users/rodrigogs/Documents/~/Downloads
```
