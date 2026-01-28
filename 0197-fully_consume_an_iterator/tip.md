---
themes:
    - "iterables"
    - "`collections` (module)"
    - "`collections.deque`"
    - "generator expressions"
---

(197)=
# 197 – Fully consume an iterator

To fully consume an iterator without wasting any memory, use an instance of `collections.deque` with its maximum length set to `0`:

```py
from collections import deque

squares = (n ** 2 for n in range(100))

deque(squares, maxlen=0)

for sq in squares:
    print(sq)
# No output!
```

Running the code above produces no output because the generator `squares` is fully consumed by the call to `deque`.

The `deque` approach is faster than an empty Python loop because `deque` is implemented in `C` whereas the loop runs at the Python level.
