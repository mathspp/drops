---
themes:
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.overload`"
    - "overloads"
---

(79)=
# 79 – Typing overloads

The usage of typing overloads allows you to declare relationships between the types of arguments and/or the return type of a function.
This allows the type checker to use information that otherwise couldn't be inferred from the function signature alone.

For example, the computation `2 * arg` works for strings and ints, and you know the result has the same type as the value used.

Wrapping that multiplication in a function and adding type hints in the naive way doesn't tell the type checker that there is a relationship between the argument type and the return value:

```py
def double(arg: str | int) -> str | int:
    return 2 * arg

reveal_type(double("hey"))  # str | int
```

Note how the type checker doesn't know whether the returned value is a string or an integer, although we know that it will be the string `"heyhey"`.

However, if you use overloads, you can specify that the argument type is the same as the return value.
Typing overloads can be as many as needed and they're decorated with `typing.overload`.
You only need to specify the function signature with the restricted relationships.
Then, you provide the full function signature and its body:

```py
from typing import overload

# If you give it strings, you get strings:
@overload
def double(arg: str) -> str: ...

# If you give it integers, you get integers:
@overload
def double(arg: int) -> int: ...

# The general function with the function body:
def double(arg: str | int) -> str | int:
    return 2 * arg

reveal_type(double("hey"))  # str
```

Note how the type checker knows that the return type is `str` because the argument is of the type `str`.
