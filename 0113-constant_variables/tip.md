---
themes:
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.Final`"
    - "naming"
    - "conventions"
    - "casing"
---

(113)=
# 113 – Constant variables

There is no way to create a true constant in Python.
Instead, you can use other mechanisms to signal to people that some values shouldn't change.

PEP 8 establishes the convention that if a variable has its name written in `ALL_UPPERCASE`, then that's a constant and you shouldn't modify its value:

```py
PI = 3.1415
```

Additionally, the module `typing` has the annotation `Final` that you can use to indicate to type checkers that a given name shouldn't be reassigned to.
`Final` is a generic that takes the true type of the variable inside square brackets `[]`:

```py
PI: Final[float] = 3.1415
```
