---
themes:
    - standard library
    - "`enum` (module)"
    - "`enum.StrEnum`"
    - strings
---

## 31 – Enumerations of string values

You shouldn't use random, loose string values in Python:

```py
UP = "UP"
DOWN = "DOWN"

def move(direction: str) -> None:
    if direction == UP:
        print("Going up.")
    elif direction == DOWN:
        print("Going down.")
    else:
        raise ValueError()
```
Instead, you should use `StrEnum` from the module `enum`:

```py
from enum import StrEnum

class Direction(StrEnum):
    UP = "UP"
    DOWN = "DOWN"

def move(direction: Direction) -> None:
    if direction == Direction.UP:
        print("Going up.")
    elif direction == Direction.DOWN:
        print("Going down.")
    else:
        raise ValueError()
```

String enumerations let you group strings values together, keeping them organised.

It also helps the IDE provide proper autocompletion when using those values.
This is ideal for argument options, for example.

**Note**: `enum.StrEnum` is only available from Python 3.11 onward.
In earlier versions, you can define an enumeration that inherits from `enum.Enum` and `str`:

```py
from enum import Enum

class Direction(str, Enum):
    ...
```
