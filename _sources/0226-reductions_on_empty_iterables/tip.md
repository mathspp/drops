---
themes:
    - "iterables"
    - "`sum`"
---

(226)=
# 226 – Reductions on empty iterables

It's useful to know and understand what are the results of functions like `sum` and all `when` called on empty iterables:

```py
sum([])  # 0
math.prod([])  # 1
all([])  # True
any([])  # False
```

To understand these results, it can be useful to work backwards.
For the built-in `sum`, for example, note how all of these are the same:

```py
sum([1, 2, 3]) == 3 + sum([1, 2])  # 6

sum([1, 2])    == 2 + sum([1])     # 3

sum([1])       == 1 + sum([])      # 1
```

Look at the last equality.
If `sum([1])` is the same as `1 + sum([])`, which happens to be `1`, then `sum([])` must be equal to `0`!
