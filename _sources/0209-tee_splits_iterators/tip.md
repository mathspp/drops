---
themes:
    - "`itertools`"
    - "`itertools.tee`"
    - "iterables"
    - "iterator protocol"
    - "generator expressions"
---

(209)=
# 209 – `itertools.tee` splits iterators

Iterators can only be traversed once, like is the case with generators:

```py
squares = (x ** 2 for x in range(3))

for sq in squares:
    print(sq, end=", ")
# 0, 1, 4,

for sq in squares:
    print(sq, end=", ")
# <no output>
```

The second loop produces no output because the generator was exhausted during the first loop.

By using `itertools.tee`, you can work around this limitation, since `itertools.tee` allows you to create 2+ independent iterators out of a single iterator:

```py
from itertools import tee

squares = (x ** 2 for x in range(3))
sq1, sq2 = tee(squares, 2)

for sq in sq1:
    print(sq, end=", ")
# 0, 1, 4,

for sq in sq2:
    print(sq, end=", ")
# 0, 1, 4,
```

This time, the second loop produces the same output as the first loop because both loops traverse two different iterators (`sq1` and `sq2`), that were returned by `itertools.tee`.
