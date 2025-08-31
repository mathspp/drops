---
themes:
    - "standard library"
    - "`enum` (module)"
    - "`enum.global_enum`"
    - "global names"
---

## 38 – Global enumeration members

The module `enum` has a lot of little-known useful tools.
For example, you can use the decorator `enum.global_enum` to automatically export your enumeration members to the global namespace of your module.

This means that you can access enumeration members as `re.MULTILINE` instead of `re.RegexFlag.MULTILINE` (yup, the module `re` uses this!).

The decorator `global_enum` can be used on all types of enumerations; the snippet below applies it to a flag enumeration:

```py
from enum import Flag, auto, global_enum

@global_enum
class FilePermissions(Flag):
    READ = auto()
    WRITE = auto()
    EXECUTE = auto()
```

After defining the enumeration, enumeration members can be used as if they were globals:

```py
BASE_PERMISSIONS = READ | WRITE
```

Accessing members through the enumeration class still works, though.

Further reading:

 - [Module `enum` overview](https://mathspp.com/blog/module-enum-overview)
