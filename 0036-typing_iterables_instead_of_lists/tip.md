---
themes:
    - "type hints"
    - "standard library"
    - "`typing` (module)"
    - "`typing.Iterable`"
    - "`collections.abc`"
    - "`collections.abc.Iterable`"
    - "iterables"
---

## 36 – Typing iterables instead of lists

Setting the type of function arguments to `list` when all you need is to be able to iterate over that value is a mistake:

```py
# Why must `files` be a list?!
def create_files(files: list[Path]) -> None:
    for file in files:
        ...
```

Thankfully, it's a mistake that is easy to fix: use `Iterable`:

```py
from collections.abc import Iterable  # Python 3.9+

def create_files(files: Iterable[Path]) -> None: ...
```

(In Python 3.8, use `typing.Iterable`. In Python 3.9+, use `collections.abc.Iterable`.)

Using `list` is bad because it prevents you from using tuples, generators, iterables from `itertools`, other collections, etc.

**Note**: keep in mind that if you need to be able to iterate twice or more over the same iterable, you might want to use `Sequence` instead of `Iterable` because of iterators.
Iterators are iterables but they can only be iterated over once.
