---
themes:
    - "strings"
    - "text processing"
    - "`str.split`"
    - "`str.rsplit`"
    - "`str.partition`"
    - "`str.rpartition`"
---

## 175 – Split from both sides

The string method `split` has a counterpart `rsplit` that starts splitting from the end of the string.
If you split without restrictions, they behave the same way:

```pycon
>>> "This is bananas".split()
['This', 'is', 'bananas']

>>> "This is bananas".rsplit()
['This', 'is', 'bananas']
```

However, if you specify a value for the parameter `maxsplit`, then `split` will find the first splits:

```py
s = "This is bananas"
first, rest = s.split(maxsplit=1)
print(first)  # This
print(rest)  # is bananas
```

While `rsplit` will find the last splits:

```py
s = "This is bananas"
rest, last = s.rsplit(maxsplit=1)
print(last)  # bananas
print(rest)  # This is
```

The string method `partition` also has a counterpart `rpartition` that partitions from the right.

These two methods that start operating from the end of the string are useful when you only want the last segment(s) of a string.
