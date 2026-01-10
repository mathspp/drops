---
themes:
    - "strings"
    - "`str.split`"
    - "unexpected argument"
---

(165)=
# 165 – Controlled string splitting

The string method `str.split` has a parameter `maxsplit` that determines the maximum number of splits that will be performed:

```py
>>> "a/b/c/d".split("/", 1)
['a', 'b/c/d']

>>> "a/b/c/d".split("/", 2)
['a', 'b', 'c/d']

>>> "a/b/c/d".split("/", 3)
['a', 'b', 'c', 'd']

>>> "a/b/c/d".split("/", 4)
['a', 'b', 'c', 'd']
```

The call to the method returns a list with the splits and possibly the remainder of the string, which means that the maximum length of the list returned is `maxsplit + 1`.
