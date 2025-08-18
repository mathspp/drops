---
themes:
    - "idioms"
    - "iterables"
    - "standard library"
    - "`itertools`"
    - "`itertools.groupby`"
    - "`itertools.islice`"
---

## 120 – All equal

To check if all values of an iterable are equal (up to a `key` function), you can use `itertools.groupby` and check how many groups are found (under the same `key` function):

```py
from itertools import groupby, islice

def take(iterable, n):
    return list(islice(iterable, n))

def all_equal(iterable, *, key=None):
    return len(take(
        groupby(iterable, key),
        2,
    )) <= 1
```

The function `all_equal` uses `groupby` to create runs of elements that are the same under the function `key`.
Then, the function `take` is used to try and take the first 2 of those runs.
If there are no runs, or if there is only one run, it's because all values were the same.
