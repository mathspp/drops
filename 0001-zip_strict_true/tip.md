---
themes:
        - "`zip`"
    - "`strict` (keyword argument)"
    - "unexpected argument"
---

## 1 – `zip`'s keyword argument `strict`

The Python built-in `zip` has a keyword argument `strict` that will raise an error if the 2 (or more) iterables that you pass to `zip` don't have the same length.

Use this whenever you are passing arguments that should have the same length: it helps catch errors early.

Beware that `zip` only raises the error when it reaches the end of the shortest iterable.
In other words, it doesn't validate the lengths upfront.

That's why you are able to print the first two names, and only then `zip` raises a `ValueError` when the list `lasts` ends:

```py
firsts = ["Luke", "Darth", "Obi-Wan"]
lasts = ["Skywalker", "Vader"]
for first_name, last_name in zip(firsts, lasts, strict=True):
    print(f"{first_name} {last_name}")
```
```
Luke Skywalker
Darth Vader
Traceback (most recent call last):
  File "<python-input-0>", line 3, in <module>
    for first_name, last_name in zip(firsts, lasts, strict=True):
                                 ~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ValueError: zip() argument 2 is shorter than argument 1
```

Further reading:

 - [Article about `zip`](https://mathspp.com/blog/pydonts/zip-up)
