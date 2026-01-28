---
themes:
    - "dictionaries"
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.TypedDict`"
---

(194)=
# 194 – Type-safe dictionaries

You can add type safety to dictionaries with a fixed structure by using `typing.TypedDict`, which you define by specifying the keys and the types of the values:

```py
from typing import TypedDict

class Config(TypedDict):
    debug_mode: bool
```

The typed dictionary `Config` is a dictionary that has the key `"debug_mode"`, and that key maps to a Boolean value.
Then, if you use the type `Config` in your code, your static type checker will ensure you're using a dictionary that contains the required keys:

```py
def run(..., c: Config) -> None:
    if c["debug_mode"]:
        print("run starting")
    ...
```

The key access `c["debug_mode"]` type checks because the dictionary `c` is a `Config` dictionary, which has the key `"debug_mode"` that maps to a Boolean value.

If you didn't use a typed dictionary, you would probably say that `c` is a dictionary that maps strings to Booleans:

```py
def run(..., c: dict[str, bool]) -> None:
    if c["debug_mode"]:
        print("run starting")
    ...
```

In this case, there is an _infinite_ number of dictionaries that would pass type checking if passed to the function `run` and that would raise a `KeyError` because they don't have the correct key.
