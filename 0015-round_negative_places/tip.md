---
themes:
    - "integers"
    - "built-ins"
    - "`round`"
    - "unexpected argument"
---

## 15 – Round to pretty whole numbers

The built-in `round` can be used to round numbers to nice, pretty integers.
More concretely, you can use `round` to round numbers to powers of 10.

For example, to round $1374 to $1400 you would do `round(1374, -2)`.

The second argument of `round`, which must be an integer, will give you the power of `0.1` that the number will be rounded to:

| `n` | `0.1 ** n` |
| | |
| `2` | `0.01` |
| `1` | `0.1` |
| `0` | `1` |
| `-1` | `10` |
| `-2` | `100` |
