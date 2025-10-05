---
themes:
    - "sets"
---

## 148 – Set operations with operators

Many set operations, like containment checks, can be written with Python's operators instead of method calls.
This allows for succinct but expressive code:

```py
import string

allowed_chars = set(string.ascii_letters)

s = "I like trains."

if not (used := set(s)) <= allowed_chars:
    print("Illegal characters found:")
    print(used - allowed_chars)

# Illegal characters found:
# {' ', '.'}
```

The comparison `used <= allowed_chars` is the same as `used.issubset(allowed_chars)` and checks whether `used` is contained within `allowed_chars`.

The operation `used - allowed_chars` is the same as `used.difference(allowed_chars)` and computes all elements of `used` that are not in `allowed_chars`.
