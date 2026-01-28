---
themes:
    - "slicing"
    - "sequences"
---

(186)=
# 186 – Assigning to list slices

List slices can be assigned to:

```py
my_list = [0, 1, 2, 3, 4, 5]
# my_list[2:4] --^^^^

my_list[2:4] = [98, 99]
print(my_list)  # # [0, 1, 98, 99, 4, 5]
```

A regular assignment to a list slice replaces the values that were in the slice.

The assigned value must be an iterable, but that's the only restriction.
It doesn't even have to be of the same length as the slice on the left of the assignment operator:

```py
my_list[2:4] = "abcd"
print(my_list)
# [0, 1, 'a', 'b', 'c', 'd', 4, 5]
```

The assignment above replaced the integers `98` and `99` with the four letters of the string `"abcd"`.

A consequence of the statement above, about the length of the iterables, is that using an empty iterable will delete the slice:

```py
my_list[2:6] = []
print(my_list)  # [0, 1, 4, 5]
```

The slice `my_list[2:6]` was the list `['a', 'b', 'c', 'd']`, so assigning it to an empty iterable delete those values from the list `my_list`.
