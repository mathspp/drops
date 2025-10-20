---
themes:
    - "filesystem"
    - "standard library"
    - "`pathlib`"
    - "`pathlib.Path`"
    - "`pathlib.Path.copy`"
    - "`pathlib.Path.copy_into`"
    - "3.14 (new in Python 3.14)"
---

## 151 – copy files

You can copy files and directories to new locations by using `pathlib.Path.copy`.

Suppose your filesystem looks like this:

```
- base/
   - other/
   - myfile.txt
```

If your current working directory is `base`, then the snippet

```py
from pathlib import Path

Path("myfile.txt").copy("myfile2.txt")
```

will create a copy of `myfile.txt` named `myfile2.txt` next to it:

```
- base/
   - other/
   - myfile.txt
   - myfile2.txt
```

However, if instead you run the snippet

```py
from pathlib import Path

Path("myfile.txt").copy_into("other")
```

then the file `myfile.txt` is copied, with the same name, into the folder `other`:

```
- base/
   - other/
      - myfile.txt
   - myfile.txt
```

The methods `copy` and `copy_into` accept strings or `pathlib.Path` objects, although these two examples used strings.
