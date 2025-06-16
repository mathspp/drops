---
themes:
    - "iterables"
    - "standard library"
    - "`itertools`"
    - "`itertools.chain`"
---

## 74 – Peek at an iterable

To know the first element of a list, you index with `[0]`.
However, not all iterables can be indexed.

In general, to get the first element of an iterable (to “peek” at it), you can use `next` to fetch that element and then you can use `chain` from the module `itertools` to “glue it back”.

Here is an example of how to do this:

```py
from itertools import chain

def peek(iterable):
    iterator = iter(iterable)
    first = next(iterator)
    return first, chain([first], iterator)
```

This specific implementation raises a `StopIteration` error if the iterable is empty.
Other behaviours can be easily implemented.
