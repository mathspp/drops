---
themes:
    - "standard library"
    - "3.14 (new in Python 3.14)"
    - "functional programming"
    - "`operator` (module)"
    - "`operator.is_none`"
    - "`operator.is_not_none`"
---

(162)=
# 162 – Check for `None` functionally

Typically you use the expressions `... is None` and `... is not None` to check whether an object is or isn't `None`, respectively.

The module `operator` provides the functions `is_none` and `is_not_none` that perform the same checks:

```py
from operator import is_none, is_not_none

print(is_none(None))  # True
print(is_not_none(None))  # False

print(is_none(73))  # False
print(is_not_none(73))  # True
```

These are useful when you're using higher-order functions.
