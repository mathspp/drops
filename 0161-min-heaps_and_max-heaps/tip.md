---
themes:
    - "algorithms"
    - "`heapq`"
    - "standard library"
    - "3.14 (new in Python 3.14)"
---

## 161 – min-heaps and max-heaps

The module `heapq` has support for min-heaps and max-heaps, providing a number of functions to work efficiently with priority queues:

```py
from heapq import (
    heapify,
    heappush,
    heappop,
    heappushpop,
    heapreplace,
)  # for min-heaps
```

For max-heaps, append the suffix `_max` to the name of each function:

```py
from heapq import (
    heapify_max,
    heappush_max,
    heappop_max,
    heappushpop_max,
    heapreplace_max,
)  # for max-heaps
```

Support for min-heaps has been around for a while but support for max-heaps was only added in Python 3.14.
