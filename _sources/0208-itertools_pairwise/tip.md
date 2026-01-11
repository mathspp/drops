---
themes:
    - "standard library"
    - "`itertools`"
    - "iterables"
    - "`itertools.pairwise`"
---

(208)=
# 208 – `itertools.pairwise`

`itertools.pairwise` accepts an iterable as its only argument and produces a sequence of overlapping pairs of consecutive elements:

```py
from itertools import pairwise

queue = ["Harry", "Hermione", "Ron"]

for front, back in pairwise(queue):
    print(f"{front} is directly in front of {back}.")
# Harry is directly in front of Hermione.
# Hermione is directly in front of Ron.
```
