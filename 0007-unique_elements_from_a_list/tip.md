---
themes:
    - builtins
    - "`set`"
    - uniqueness
    - "`dict.fromkeys`"
---

## 7 – Unique elements from a list

The built-in type `set` can be used if you need to compute the unique values from an iterable, like a list.

Because sets are unordered, the result will contain the unique values in an arbitrary order.

```py
nums = [42, 73, 42, 42, 0, 73, 10, 10, 16]
for unique_num in set(nums):
    print(unique_num, end=" ")
# 0 73 42 10 16
```

If the order is important and you're running Python 3.8 or later, you can use `dict.fromkeys` instead:

```py
nums = [42, 73, 42, 42, 0, 73, 10, 10, 16]
for unique_num in dict.fromkeys(nums):
    print(unique_num, end=" ")
# 0 73 42 10 16
```

These two options are very efficient and only work with hashable values.

Further reading:

 - [Itertools recipes for `unique_justseen`, `unique_everseen`, and `unique`](https://docs.python.org/3/library/itertools.html#itertools-recipes)
