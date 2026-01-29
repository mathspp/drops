---
themes:
    - "validation"
    - "match statement"
    - "structural pattern matching"
    - "typing/type hints"
    - "vertical bar `|`"
---

(81)=
# 81 – Structural validation and homogenisation

Some functions can accept arguments in many different formats.
In that case, structural pattern matching can be used to validate the argument and to homogenise it.

For example, padding in CSS can be specified as a single integer, or as a tuple of 1, 2, or 4 integers.
But in CSS the padding is always unwrapped into 4-item tuples.

Some valid examples and the conversions:

 - `10` is converted to `(10, 10, 10, 10)`
 - `(5, 10)` is converted to `(5, 10, 5, 10)`
 - `(1, 2, 3, 4)` is converted to `(1, 2, 3, 4)`

Using the `match` statement you can easily write a function that validates this structure and does the conversion:

```py
def unpack_padding(pad) -> tuple[int, int, int, int]:
    match pad:
        case int(p) | (int(p),):
            return (p, p, p, p)
        case (int(vert), int(horz)):
            return (vert, horz, vert, horz)
        case (int(top), int(right), int(bottom), int(left)):
            return (top, right, bottom, left)
        case _:
            raise ValueError(f"1, 2 or 4 integers required for padding; got {pad!r}.")
```

Further reading:

 - [Structural pattern matching tutorial](https://mathspp.com/blog/pydonts/structural-pattern-matching-tutorial).
 - [`match` statement cheatsheet](https://mathspp.gumroad.com/l/cheatsheet_match_statement).
