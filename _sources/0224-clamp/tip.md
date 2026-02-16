---
themes:
    - "built-ins"
    - "algorithms"
    - "`min`"
    - "`max`"
---

(224)=
# 224 – Clamp

You can write a function `clamp`, that clamps a value between two bounds, by combining the built-ins `max` and `min`.
For example, to ensure a value is a valid percentage, you can write `clamp_percentage`:

```py
def clamp_percentage(value):
    return min(max(value, 0), 100)
```

The call `max(value, 0)` ensures that the result is, _at least_, 0, and the call `min(..., 100)` ensures that the value is, _at most_, 100.
Together, the two restrictions ensure that the value is a valid percentage.

For a more general function `clamp`, the lower and upper bounds can be passed in as function arguments.
