---
themes:
    - "standard library"
    - "`enum` (module)"
    - "`enum.auto`"
    - "introspection"
---

(39)=
# 39 – Automatic enumeration values

The module `enum` provides a function `auto` that you can use to automatically generate values for your enumeration members.

The default behaviour is to create successive integers starting at 1 for a standard enumeration:

```py
from enum import Enum, auto

class Letter(Enum):
    A = auto()
    B = auto()

print(Letter.A.value)  # 1
print(Letter.B.value)  # 2
```

The function `auto` is also smart enough to specialise appropriately, depending on the type of enumeration.

For flag enumerations, it produces powers of 2 for the flags:

```py
from enum import Flag, auto

class Permissions(Flag):
    READ = auto()     # 1
    WRITE = auto()    # 2
    EXECUTE = auto()  # 4

print(repr(Permissions.EXECUTE))
# <Permissions.EXECUTE: 4>
```

For string enumerations, it generates lowercase strings that match the member names:

```py
from enum import StrEnum, auto

class Direction(StrEnum):
    NORTH = auto()  # north
    SOUTH = auto()  # south
    ...

print(repr(Direction.NORTH))
# <Direction.NORTH: 'north'>
```

Further reading:

 - [Module `enum` overview](https://mathspp.com/blog/module-enum-overview)
