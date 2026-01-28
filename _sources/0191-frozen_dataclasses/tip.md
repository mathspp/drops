---
themes:
    - "`dataclassses.dataclass`"
    - "immutability"
    - "hashing"
    - "performance optimisation"
---

(191)=
# 191 – Frozen dataclasses

Frozen dataclasses are created by setting `frozen=True` in the decorator `dataclass`:

```py
from dataclasses import dataclass

@dataclass(frozen=True)
class Point:
    x: int
    y: int
```

By being set to frozen, data classes become immutable and hashable, making them usable as dictionary keys or as set elements:

```py
p = Point(0, 0)

my_dict = {p: "origin"}
print(my_dict)
# {Point(x=0, y=0): 'origin'}
```

Surprisingly, frozen dataclasses pay a tiny performance penalty.
