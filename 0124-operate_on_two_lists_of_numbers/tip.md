---
themes:
    - "iterables"
    - "standard library"
    - "`operator` (module)"
    - "`itertools`"
    - "`itertools.zip_longest"
    - "`itertools.starmap`"
    - "`map`"
---

## 124 – Operate on two lists of numbers

If you combine the module `operator` with `itertools.starmap` and `itertools.zip_longest`, you can write any function that merges two lists by operating on respective pairs of elements.

`zip_longest` allows you to operate until the end of the longer list and then `starmap` allows you to unpack the tuples into arguments of the operation you chose.
If you don’t need `zip_longest` to get to the end of the longer iterable, then you can just use the built-in `map(add, l1, l2)` and `starmap` ends up not being needed either.

The example below adds two lists, element by element, padding the shorter list with zeroes:

```py
from itertools import starmap, zip_longest
from operator import add

def add_lists(l1, l2):
    """Function to add respective elements from two lists."""
    return list(starmap(add, zip_longest(l1, l2, fillvalue=0)))

add_lists(
    [1, 2, 3],
    [10, 20, 30, 40],
)  # [11, 22, 33, 40]
```
