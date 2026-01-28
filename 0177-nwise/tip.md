---
themes:
    - "iterables"
    - "standard library"
    - "`collections` (module)"
    - "`collections.deque`"
    - "`itertools`"
    - "`itertools.islice`"
    - "`itertools.pairwise`"
    - "generators"
---

(177)=
# 177 – `nwise`

The iterable `itertools.pairwise` can be generalised to create an iterable that produces overlapping tuples of arbitrary length, instead of just pairs.

One of the best ways to generalise `pairwise` is by using `collections.deque` to manage the _window_ of values that is going to be produced next:

```py
from collections import deque
from itertools import islice

def nwise(values, n):
    iterator = iter(values)
    window = deque(islice(iterator, n - 1), maxlen=n)
    for value in iterator:
        window.append(value)
        yield tuple(window)
```

The line `window = deque(islice(...), ...)` seeds the `deque` with its first values.
Then, the loop adds a value to the window and yields it as a tuple.
`deque` is convenient to use here because of its parameter `maxlen`, that automatically makes sure the `deque` doesn't grow too large.
