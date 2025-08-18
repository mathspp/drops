---
themes:
    - "lists"
    - "iterables"
    - "performance optimisation"
---

## 119 – Efficiently extending a list

The method `extend` is the efficient way of adding multiple elements to a list in one go:

```py
my_list = [...]

my_list.extend(other_list)
```

This also works with other iterables, even if they're not lists.

A common alternative that also works with non-list iterables is using a `for` loop that calls the method `append` repeatedly:

```py
my_list = [...]

for value in other_list:
    my_list.append(value)
```

However, this is inefficient because the repeated calls to `append` will waste time constantly resizing the list.

Another alternative that may sound like a good idea but actually wastes time and memory computing a third list is concatenating the two lists:

```py
my_list = [...]

my_list = my_list + other_list
```
