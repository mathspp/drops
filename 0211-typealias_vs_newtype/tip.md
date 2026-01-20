---
themes:
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.NewType`"
    - "type alias"
---

(211)=
# 211 – `TypeAlias` vs `NewType`

While similar at first sight, `TypeAlias` and `NewType` are fundamentally different.
`TypeAlias` creates a synonym to a complex type with the purpose of simplifying long or cumbersome type signatures:

```py
type P = tuple[int, int]

def add_points(p1: P, p2: P) -> P:
    x1, y1 = p1
    x2, y2 = p2
    return (x1 + x2, y1 + y2)
```

By creating the type alias `P`, you don't have to write `tuple[int, int]` three times in the signature of the function `add_points`.

`P` being a type _alias_, `P` and `tuple[int, int]` are completely interchangeable:

```py
p: tuple[int, int] = (1, 2)
reveal_type(add_points(p, p))
# Revealed type: tuple[int, int]
```

Despite being typed as `tuple[int, int]`, the variable `p` can be used as the argument for `add_points`, and despite being typed as returning a value of type `P`, the type of the return value of the function `add_points` is revealed to be `tuple[int, int]`.

On the other hand, `NewType` creates a new type that can be seen as a specialised version of the original type:

```py
from typing import NewType

Length = NewType("Length", int)
Area = NewType("Area", int)

def square_area(l: Length) -> Area:
    return Area(l * l)
```

Despite being both integers, a length is semantically different from an area, and the new types `Length` and `Area` can encode that information.

By using new types, the type checker will warn you if you try to mix different types of integers up:

```py
a = square_area(3)  # Type error.
a2 = square_area(a)  # Type error.
```

The call `square_area(3)` fails type checking because the function `square_area` expects explicitly a `Length`, and not just a normal integer.
Similarly, `square_area(a)` fails type checking because `a` is of type `Area`, which is semantically different from the `Length` that the function expects.
