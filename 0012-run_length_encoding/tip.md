---
themes:
    - "standard library"
    - "iterables"
    - "`itertools`"
    - "`itertools.groupby`"
---

## 12 – Run-length encoding

The module `itertools` has a very funky iterable called `groupby`.
If you're imaginative, you can use it for all sorts of things.

One possible use-case is to compute the run-length encoding of an iterable.
All it takes is to go through the grouped iterable and then compute the length of each group:

```py
from itertools import groupby

def run_length_encoding(iterable):
    for val, group in groupby(iterable):
        yield val, len(list(group))
```

Each group is a lazy iterable iself, so you can't use `len` directly on it.
That's why you see `len(list(group))` in the code above.

Here's an example usage:

```py
print(list(
    run_length_encoding("AAAB0AA")
))  # [('A', 3), ('B', 1), ('0', 1), ('A', 2)]
```
