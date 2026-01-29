---
themes:
    - "list comprehensions"
---

(187)=
# 187 – Anatomy of a list comprehension

A list comprehension is made up of three sections:

1. **Data transformation**: The code that is transforming elements by applying a function or another expression to your values.
2. **Data source**: If you're transforming data, the data must come from somewhere.
3. **Data filter**: Optionally, you can add a data filter so you're only transforming _some_ of the elements coming from the data source.

These three parts make up a general list comprehension.
In code, it looks like this:

```py
my_list = [
    data_transformation(value)  # 1
    for value in data_source    # 2
    if predicate(value)         # 3
]
```

Each line of the list comprehension above maps to one of the sections of a list comprehension.
Here is a concrete example:

```py
my_list = [
    n ** 2                           # 1
    for n in range(1000)             # 2
    if (n % 3 == 0) or (n % 5 == 0)  # 3
]
```

The list comprehension above

1. computes squares
2. of the integers from `0` to `999`
3. but only if the integer is divisible by `3` or `5`.

Further reading:

 - [List comprehensions 101](https://mathspp.com/blog/pydonts/list-comprehensions-101)
 - [List comprehensions cheatsheet](https://mathspp.gumroad.com/l/comprehending-comprehensions-poster)
