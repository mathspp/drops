---
themes:
    - "standard library"
    - "`functools`"
    - "`functools.partial`"
    - "`key` (keyword argument)"
    - "`max`"
    - "`min`"
    - "`len`"
---

(41)=
# 41 – Longest and shortest

The built-ins `max` and `min` have a keyword argument `key` that lets you change the frame of reference for comparisons.

If you then use `functools.partial` to attach another function to `key`, you essentially build new functions just like LEGOs.

My two favourite examples:

 1. `max` + `key=len` builds the function `longest`; and
 2. `min` + `key=len` builds the function `shortest`.

```py
from functools import partial

longest = partial(max, key=len)
shortest = partial(min, key=len)

words = "This is a truly extraordinary sentence".split()
print(longest(words))  # extraordinary
print(shortest(words))  # a
```
