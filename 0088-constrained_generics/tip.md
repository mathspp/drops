---
themes:
    - "typing/type hints"
    - "generics"
    - "type variables"
    - "type parameter syntax"
    - "3.12 (new in Python 3.12)"
---

## 88 – Constrained generics

Generics (functions and classes) can be constrained.
This means that the variable type must be one of two (or more) specified types.

Consider the function `double` as a motivating example:

```py
def double[T](value: T) -> T:
    return 2 * value
```

The fact that the function `double` is generic explicitly states the relationship between the argument type and the return type, which is preserved in calls like `double(2)` or `double("hello")`.

However, with the given type hints, it's not immediately obvious to type hinters what types of values can be passed to the function `double`.
To make that explicit, the type variable `T` can be annotated with a tuple of two or more types, therefore constraining `T` to be one of those types:

```py
def double[T: (str, int, float)](value: T) -> T:
    return 2 * value
```

In this new definition, type checkers will only accept arguments of type `str`, `int`, or `float`, for the function `double`.

For example, if `None` is used, mypy will complain:

```
Value of type variable "T" of "double" cannot be "None"  [type-var]
```
