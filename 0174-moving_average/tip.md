---
themes:
    - "data structures"
    - "algorithms"
    - "standard library"
    - "`collections` (module)"
    - "`collections.deque`"
    - "`itertools`"
    - "`itertools.islice`"
    - "`iter`"
    - "mathematics"
---

## 174 – Moving average

To compute the moving average of an iterable of values, use `collections.deque` to manage the window.
The parameter `maxlen` that the `deque` has makes it very easy to manage the window and its elements:

```py
from collections import deque
from itertools import islice

def moving_average(values, n):
    source = iter(values)
    window = deque(islice(source, n - 1), maxlen=n)
    averages = []
    for value in source:
        window.append(value)
        averages.append(sum(window) / n)
    return averages

moving_average([10, 20, 30], 2)
# [15.0, 25.0]
```

When you append to the window inside the `for` loop, the window will automatically evict its leftmost element to keep its size at `n` elements.

Further reading:

 - [Python `deque` tutorial](https://mathspp.com/blog/python-deque-tutorial)
