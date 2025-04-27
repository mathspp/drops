---
themes:
    - iterables
    - splat operator `*`
    - asterisk `*`
---

## 35 – Inline lists and tuples

The splat operator `*` can be used to inline iterables inside other iterables.
Just use the asterisk `*` when writingh out a comma-separated list of values and whatever iterable the asterisk is next to will be “flattened” or unpacked in that position.

This means that using `*iterable` in a comma-separated list will be as if the values from `iterable` had been written explicitly in that place.

Even works with generators!

```py
firsts = ("Han", "Obi-Wan", "Darth")

def more_firsts():  # Generator
    yield "Frodo"
    yield "Gandalf"

huge_crossover = [
    "Harry", "Hermione", "Ron",
    *firsts,
    *more_firsts(),
    "Guido",
]

print(huge_crossover)
# ['Harry', 'Hermione', 'Ron',
#  'Han', 'Obi-Wan', 'Darth',
#  'Frodo', 'Gandalf', 'Guido']
```
