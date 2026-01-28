---
themes:
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.reveal_type`"
    - "debugging"
    - "`sys.stderr`"
    - "3.11 (new in Python 3.11)"
---

(214)=
# 214 – `reveal_type`

The module `typing` provides a debugging aid, the function `reveal_type`.
When a static type checker encounters it, the static type checker emits a note with the _inferred_ type of the expression passed into `reveal_type`:

```py
def s() -> str:
    return 3

reveal_type(s())
# Revealed type is "builtins.str"
```

The function `reveal_type` doesn't even need to be imported and the static type checker infers that `s()` is a string because of the return type `-> str`.
(The static type checker also complains about the fact that we're returning an integer from inside `s` while the function should return a string, but you'll see why I'm doing that in a second.)

At runtime, the function `reveal_type` prints the runtime type of the argument to `sys.stderr` and returns the argument unchanged:

```py
from typing import reveal_type

def s() -> str:
    return 3

reveal_type(s())
# Runtime type is 'int'
```

At runtime, the type of `s()` is `int` because the function `s` returns the integer 3.
For the code to work at runtime, `typing.reveal_type` _must_ be imported since it's not a built-in.
