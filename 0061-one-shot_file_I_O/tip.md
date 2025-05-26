---
themes:
    - "file I/O"
    - "standard library"
    - "`pathlib`"
    - "`pathlib.Path.read_text`"
    - "`pathlib.Path.write_text`"
---

## 61 – One-shot file I/O

For one-shot file I/O, like simply reading the full contents of a file or writing some text to a file, you can use the methods `read_text` and `write_text` from `pathlib.Path`.

Here is a short example:

```py
from pathlib import Path

filepath = Path("hello_world.txt")

filepath.write_text("Python is cool!")

print(filepath.read_text())
# Python is cool!
```

Note that if the file exists, `write_text` will overwrite the contents of the file.

If you use a context manager and the built-in `open` you get more control, but these two methods get the job done most of the time.

Further reading:

 - [Module `pathlib` overview](https://mathspp.com/blog/module-pathlib-overview).
