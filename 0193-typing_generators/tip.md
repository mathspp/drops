---
themes:
    - "typing/type hints"
    - "`collections.abc.Generator`"
    - "`collections.abc`"
    - "3.13 (new in Python 3.13)"
    - "generics"
---

(193)=
# 193 – Typing generators

Generator type hints are cumbersome to write because the generic type `Generator` takes three arguments:

```py
from collections.abc import Generator

def simple_generator(stop: int) -> Generator[int, None, None]:
    for x in range(stop):
        yield x ** 2
```

The three types indicate the type of the yielded values, the type of the send values, and the type of the return.

In Python 3.13, the send and return types were changed so that they default to `None`, allowing you to simplify many usages of `Generator`:

```py
from collections.abc import Generator

def simple_generator(stop: int) -> Generator[int]:
    for x in range(stop):
        yield x ** 2
```

The omission of the second and third types indicate that they are `None`.
