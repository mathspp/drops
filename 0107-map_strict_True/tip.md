---
themes:
    - "`strict` (keyword argument)"
        - "`map`"
    - "3.14 (new in Python 3.14)"
    - "unexpected argument"
---

## 107 – `map`'s keyword argument `strict`

Akin to `zip`’s keyword argument `strict`, in Python 3.14 the built-in `map` got a keyword argument `strict`.
By setting `strict=True`, you get a `ValueError` if the iterables have different lengths:

```py
bases = [2, 3, 4, 2, 3, 4]
exps = [2, 2, 2]

for num in map(pow, bases, exps, strict=True):
    print(num, end=" ")
# 4 9 16
# ValueError
```

In 99% of the situations where you use [`map` with multiple arguments](#map-with-multiple-arguments) you’ll want to set this, so don’t forget it!
