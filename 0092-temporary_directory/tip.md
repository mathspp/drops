---
themes:
    - "filesystem"
    - "file I/O"
    - "`tempfile`"
    - "`tempfile.TemporaryDirectory`"
    - "standard library"
    - "automatic cleanup"
---

## 92 – Temporary directories

Use the module `tempfile` from the standard library to create a temporary directory.
The context manager `TemporaryDirectory` cleans up the directory and its contents when closed.

```py
import tempfile

with tempfile.TemporaryDirectory() as tmpdirname:
    print(f"Created temp directory {tmpdirname}.")
    ...  # Do whatever you want inside this directory...
```

Once the context manager is closed, everything is cleaned up – including the contents of the directory – so you can use it to create and manipulate other files that will be automatically cleaned up.

For example, I used this to edit a video:
my program creates a temporary directory and then copies the excerpts of the video that I care about into small segments that are saved in the temporary directory.
Then, the segments are all pasted together into a single video that is saved elsewhere.
Once the temporary directory goes away, the small segments are also cleaned up.
