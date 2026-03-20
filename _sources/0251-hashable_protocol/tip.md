---
themes:
    - "typing/type hints"
    - "`collections.abc`"
    - "`collections.abc.Hashable`"
    - "hashing"
    - "`set`"
    - "sets"
---

(251)=
# 251 – Hashable protocol

The module `collections.abc` provides a protocol `Hashable` that is suitable for when you want to specify that certain objects must be hashable (so they can be used as dictionary keys, for example).

The function `count_unique`, shown below, uses `Hashable` to make sure the built-in `set` can be used:

```py
from collections.abc import Hashable

def count_unique(values: list[Hashable]) -> int:
    return len(set(values))
```

By using `Hashable`, a function call like the one shown below type checks because integers are hashable:

```py
count_unique([1, 2, 3, 2, 1, 2])  # 3
```

The return value is `3`, naturally.

On the other hand, a function call with a list of lists doesn't type check (and fails at runtime) because lists are not hashable:

```py
count_unique([[1, 2], [2, 3], [1, 2]])
```
