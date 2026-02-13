---
themes:
    - "iterables"
    - "standard library"
    - "`collections` (module)"
    - "`collections.deque`"
    - "`itertools`"
    - "`itertools.islice`"
    - "`itertools.pairwise`"
    - "`itertools.tee`"
    - "generators"
    - "`zip`"
    - "`yield from`"
---


(221)=
# 221 – Generalise `pairwise` with `tee`

You can implement a generalisation of `itertools.pairwise` by using `itertools.tee`:

```py
from collections import deque
from itertools import islice, tee

def nwise(iterable, n):
    iterators = tee(iterable, n)
    for offset, it in enumerate(iterators):
        deque(islice(it, offset), maxlen=0)
    yield from zip(*iterators)
```

The call to `tee` creates `n` independent iterators.

The loop is used to offset each iterator by a growing number of values that matches the index of the iterator in the list of iterators.
You use `islice` to create this offset and then `deque` consumes the slice (see the tip [197](197) about consuming an iterator).

Finally, you zip the misaligned iterators together and use the keyword `yield from` so that the generator `nwise` produces the same values as the call to `zip`.
