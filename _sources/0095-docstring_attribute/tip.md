---
themes:
    - "docstrings"
    - "dunder attributes"
    - "`__doc__`"
    - "dynamic code"
    - "`help`"
---

(95)=
# 95 – Docstring `__doc__` attribute

Docstrings are saved as an attribute `__doc__` on the objects they were defined in.
(Both functions and classes.)

This `__doc__` is a string attribute that is both readable and writable.
This is used by the built-in `help`, by `functools.wraps` in decorators, and more.

As an example, consider the function `fn` with a short docstring:

```py
def fn():
    """Docstring!"""
```

If you use the built-in `help`, you'll see the docstring:

```py
help(fn)
"""
fn()
    Docstring!
"""
```

You can read and write to this attribute:

```py
print(fn.__doc__)  # Docstring!
fn.__doc__ = "Bye!"
```

Then, things like the built-in `help` will see the new value for the docstring:

```py
help(fn)
"""
fn()
    Bye!
"""
```
