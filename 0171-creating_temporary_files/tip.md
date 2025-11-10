---
themes:
    - "filesystem"
    - "file I/O"
    - "`tempfile`"
    - "`tempfile.TemporaryFile`"
    - "standard library"
    - "automatic cleanup"
---

## 171 – Creating temporary files

You can use `tempfile.TemporaryFile` as a context manager that opens a temporary file that you can write to and read from:

```py
import tempfile

with tempfile.TemporaryFile() as f:
    f.write(b"Hello ")
    f.write(b"world!")
    
    f.seek(0)
    print(f.read().decode())  # Hello world!
```

The default mode for the file is `"w+b"`:

 - `"w+"` opens the file for writing _and_ reading, so you can use `seek` to go back to the beginning of the file and read what you wrote to the file; and
 - `"b"` opens the file in binary mode, meaning you'll write and read bytes.

Once the context manager is exited, the file is automatically deleted.

This is useful when testing functions that require file-like objects or as a buffer for when you're processing an amount of data so large that it doesn't fit into memory.
