---
themes:
    - "`*args`"
    - "`**kwargs`"
    - "asterisk `*`"
    - "typing/type hints"
---

(103)=
# 103 – Typing `*args` and `**kwargs`

When typing functions with an arbitrary number of positional arguments (`*args`) or with an arbitrary number of keyword arguments (`**kwargs`), the type hints should target the values that you’ll accept.
In other words, don’t add type hints for the tuple `args` as a whole or for the dictionary `kwargs` as a whole.

The signature below denotes a function `my_max` that accepts a variable number of integers and a variable number of keyword arguments that are Booleans:

```py
def my_max(
    *args: int,
    **kwargs: bool,
) -> int:
    ...
```

On the other hand, the signature below denotes a function `my_max` that accepts a variable number of tuples of integers and a variable number of keyword arguments that are dictionaries that map strings to Booleans:

```py
def my_max(
    *args: tuple[int, ...],
    **kwargs: dict[str, bool],
) -> int:
    ...
```
