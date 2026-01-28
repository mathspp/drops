---
themes:
    - "iterables"
    - "`itertools`"
    - "`itertools.accumulate`"
    - "`lambda` function"
---

(184)=
# 184 – `accumulate` with a custom function

You can use a custom binary function with `itertools.accumulate`, allowing you to go through an iterable and computing successive accumulated values:

```py
from itertools import accumulate
from operator import mul

print(list(accumulate(
    range(1, 6),
    mul,
)))
# [1, 2, 6, 24, 120]
```

You can also use a `lambda` function as the function argument to `accumulate`.
In that case, the left argument is the accumulated value and the right argument is the next value from the iterable:

```py
from itertools import accumulate
from operator import mul

print(list(accumulate(
    range(1, 6),
    lambda acc, v: 2 * acc + v
)))
# [1, 4, 11, 26, 57]
```
