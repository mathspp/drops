---
themes:
    - "`map`"
    - builtins
---

## 9 – `map` with multiple arguments

The Python built-in `map` can be used with 2 or more iterable arguments.

The function beig mapped will take one argument from each iterable:

```py
bases = [2, 3, 4, 2, 3, 4]
exps = [2, 2, 2, 3, 3, 3]

for num in map(pow, bases, exps):
    print(num, end=" ")
# 3 9 16 8 27 64
```

This can be more convenient to use than a list comprehension/generator expression in some situations:

```py
nums = (b ** exp for b, exp in zip(bases, exps))
# vs
nums = map(pow, bases, exps)
```

For a bonus crazy use, here is how to use this to create an infinite stream of perfect squares:

```py
from itertools import count, repeat

squares = map(pow, count(), repeat(2))
```
