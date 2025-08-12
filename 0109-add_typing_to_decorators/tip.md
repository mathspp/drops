---
themes:
    - "decorators"
    - "typing/type hints"
    - "`*args`"
    - "`**kwargs`"
    - "`typing` (module)"
    - "`typing.ParamSpec`"
    - "3.10 (new in Python 3.10)"
    - "3.12 (new in Python 3.12)"
    - "type parameter syntax"
---

## 109 – Add typing to decorators

Decorators used to be nasty to type.
How do you create an inner, general function that you then type in a way that depends on the function(s) you will be decorating?!

Python fixes this with `typing.ParamSpec` (added in Python 3.10), which allows you to refer to the signature of your original function in the signature of your new function.

In general, a decorator will look like this:

```py
def decorator(f):  # This decorator does nothing in practice.
    def wrapper(*args, **kwargs):
        return f(*args, **kwargs)
    return wrapper
```

Given this decorator, the diagram below shows a tiny usage example with the 3.12+ type parameter syntax: 

```py
from typing import Callable

def decorator[T, **P](f: Callable[P, T]) -> Callable[P, T]:
    def wrapper(*args: P.args, **kwargs: P.kwargs):
        return f(*args, **kwargs)
        
    return wrapper
```

The `[..., **P]` syntax creates a parameter specification (`typing.ParamSpec`) called `P`.
Then, the signature `(f: Callable[P, T]) -> Callable[P, T]` means that the decorator accepts a function whose **param**eter **spec**ification is `P`, and returns a function with the same parameter specification.
In other words, the decorator will preserve the signature of the function.
More specifically, the `.args` and `.kwargs` attributes of the `ParamSpec` link the original types of the arguments of `f` to the types of the arguments of `wrapper`.
