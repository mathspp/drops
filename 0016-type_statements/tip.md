---
themes:
    - "typing/type hints"
    - "type alias"
    - "generics"
---

## 16 – Type statements

Since Python 3.12 that you can use type statements to create type aliases, which can also be generic.

For example, the statement below creates a type alias called `Pair` that holds pairs of values of the same type:

```py
type Pair[T] = tuple[T, T]
```

This is much shorter than the equivalent pre-Python 3.12 code using `typing.TypeAlias` and `typing.TypeVar`:

```py
from typing import TypeAlias, TypeVar

T = TypeVar("T")

Pair: TypeAlias = tuple[T, T]
```

For both versions of the code, the following assignment type-checks:

```py
p: Pair[int] = (3, 4)
```


Further reading:

 - [`type` statement and type aliases](https://mathspp.com/blog/til/type-statement-and-type-aliases)
