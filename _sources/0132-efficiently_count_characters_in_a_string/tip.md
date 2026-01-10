---
themes:
    - "standard library"
    - "`collections` (module)"
    - "`collections.Counter`"
    - "data structures"
---

(132)=
# 132 – Efficiently count characters in a string

Python has a specialised dictionary for whenever you need to count things or represent counts: `collections.Counter`.
The only restriction you need to keep in mind is that `Counter` can only count hashable objects, since it's dictionary-like.

You can initialise by passing in an iterable of elements to count:

```py
from collections import Counter

counts = Counter("mississippi")
```

From there, you can access counts by key, even if the key isn't there:

```py
print(counts["m"])  # 1
print(counts["z"])  # 0
```

Since it's a specialised dictionary, `Counter` also includes many useful methods to work with counts, like the method `most_common`:

```py
print(counts.most_common(2))
# [('i', 4), ('s', 4)]
```
