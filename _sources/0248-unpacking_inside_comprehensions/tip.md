---
themes:
    - "3.15 (new in Python 3.15)"
    - "`*` (asterisk)"
    - "unpacking"
---

(248)=
# 248 – Unpacking inside comprehensions

Python 3.15 introduces a new syntactical feature that allows you to unpack iterables inside comprehensions:

```py
ranges = [range(2), range(2, 4), range(4, 6)]
print(ranges)
# [range(0, 2), range(2, 4), range(4, 6)]

flat = [*r for r in ranges]
print(flat)
# [0, 1, 2, 3, 4, 5]
```
