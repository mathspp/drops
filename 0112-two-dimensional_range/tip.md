---
themes:
    - "standard library"
    - "`itertools`"
    - "`itertools.product`"
    - "`range`"
    - "iterables"
---

## 112 – Two-dimensional range

You can build a two-dimensional range using the built-in `range` and `itertools.product`.
This is useful when traversing 2D structures like grids.

It’s also better than a nested for loop because it’s easier to break out of:

```py
def range_2d(n, m):
    return product(range(n), range(m))

for x, y in range_2d(10, 3):
    if x == 2:
        break
    print(x, y)
"""Output:
0 0
0 1
0 2
1 0
1 1
1 2
"""
```
