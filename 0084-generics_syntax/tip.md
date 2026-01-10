---
themes:
    - "typing/type hints"
    - "generics"
    - "type variables"
    - "functions"
    - "OOP"
    - "type parameter syntax"
    - "3.12 (new in Python 3.12)"
---

(84)=
# 84 – Generics syntax

Python 3.12 introduced many typing improvements, namely an improved syntax to define generic functions and generic classes.
Instead of having to define type variables beforehand, the type variables needed for the generic function/class can be defined with the object, making it more concise.

For example, instead of

```py
from typing import TypeVar

T = TypeVar("T")

def into_list(value: T) -> list[T]:
    return [value]
```

you can use `[...]` after the function name, and before the parameter list, to specify the type variables required:

```py
def into_list[T](value: T ) -> list[T]:
    return [value]
```

Similarly, you can define a generic class over a type variable `T` by using `[T]` immediately after the class name:

```py
class MyList[T]:
    def __init__(self, values: list[T]):
        self.values = list(values)

    def append(self, value: T ) -> None:
        self.values.append(value)

    def pop(self) -> T :
        return self.values.pop()
```
