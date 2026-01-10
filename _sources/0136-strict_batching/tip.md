---
themes:
    - "`strict` (keyword argument)"
    - "3.13 (new in Python 3.13)"
    - "standard library"
    - "`itertools`"
    - "`itertools.batched`"
---

(136)=
# 136 – Strict batching

When using `itertools.batched` with the purpose of reshaping a one-dimensional iterable into sections of a fixed size, set `strict=True` if you expect the iterable to contain a whole number of sections.

Without it, the final batch may be incomplete:

```py
from itertools import batched

for batch in batched(range(10), 4):
    print(batch)
# (0, 1, 2, 3)
# (4, 5, 6, 7)
# (8, 9)
```

If you set `strict=True`, you get a `ValueError` if the final batch is smaller than the specified size:

```py
from itertools import batched

for batch in batched(range(10), 4):
    print(batch)
# (0, 1, 2, 3)
# (4, 5, 6, 7)
# ValueError
```

Note that you only get the `ValueError` once you get to the end of the batched iterable and _not_ when you create the batched iterable:

```py
batched(range(10), 4)  # No error raised yet.
```
