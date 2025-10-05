---
themes:
    - "tuples"
    - "iterables"
    - "generators"
    - "standard library"
    - "`itertools`"
    - "`collections` (module)"
    - "`itertools.islice`"
    - "`collections.deque`"
---

## 128 – `pairwise` generalisation

`itertools.pairwise` accepts an iterable and produces overlapping pairs of consecutive elements:

```py
from itertools import pairwise

my_list = [42, 73, 16, 0, 10]
for a, b in pairwise(my_list):
    print(a, b)

"""
Output:
42 73
73 16
16 0
0 10
"""
```

If you need a similar behaviour but with tuples of an arbitrary size, you can implement that as a generator with `collections.deque` and `itertools.islice`:

```py
from collections import deque
from itertools import islice

def n_tuples(data, n):
    """Produces overlapping tuples of size `n`."""
    data = iter(data)
    window = deque(islice(data, n - 1), maxlen=n)
    for value in data:
        window.append(value)
        yield tuple(window)
```
