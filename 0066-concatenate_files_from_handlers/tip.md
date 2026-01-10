---
themes:
    - "standard library"
    - "`itertools`"
    - "`itertools.chain.from_iterable`"
    - "file I/O"
    - "performance optimisation"
    - "`file.writelines`"
---

(66)=
# 66 – Concatenate files from handlers

Suppose you need to concatenate multiple files together, for example to write a long file composed of multiple other files or to search for a pattern across all files.

If you _already_ have the file handlers in a list, use `chain.from_iterable` to go through the whole thing.

This is as memory efficient as possible since it only reads the lines from each file on demand and it doesn't hold the full contents of each file in memory.

For example, suppose you have three files:

 1. `log1.log`:

```text
08:12:03 [INFO] Starting the data sync process
08:12:04 [DEBUG] Loaded 142 user records from cache
```

 2. `log2.log`:

```text
08:12:06 [INFO] Connection to remote server established
08:12:08 [WARN] Response time exceeded threshold: 534ms
```

 3. `log3.log`:

```text
08:12:09 [DEBUG] Retry attempt #1 initiated
08:12:11 [INFO] Data sync completed successfully
```

If the files are already open in the variables `log1`, `log2`, and `log3`, respectively, then you can run

```py
open_files = [log1, log2, log3]

from itertools import chain

with open("full_log.log", "w") as f:
    f.writelines(chain.from_iterable(open_files))
```

This produces the file `full_log.log` with the contents of all three files:

```text
08:12:03 [INFO] Starting the data sync process
08:12:04 [DEBUG] Loaded 142 user records from cache
08:12:06 [INFO] Connection to remote server established
08:12:08 [WARN] Response time exceeded threshold: 534ms
08:12:09 [DEBUG] Retry attempt #1 initiated
08:12:11 [INFO] Data sync completed successfully
```

If the files haven't been opened yet, then the best thing to do is to open each one of them at a time, of course.
