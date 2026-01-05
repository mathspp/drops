---
themes:
    - "algorithms"
    - "standard library"
    - "`itertools`"
    - "`itertools.permutations`"
    - "mathematics"
    - "recursion"
    - "generators"
    - "iterables"
---

## 176 – Express permutations recursively

Recursion is disregarded by many as useless or “too fancy and theoretical to be practical”, but that's very far from the truth.
Recursion is a very natural way to express some algorithms and relationships and understanding it has many benefits.

`itertools.permutations` is an example of an algorithm that can be naturally expressed with recursion.
Consider the permutations of the list `[0, 1, 2]`:

```pycon
>>> from itertools import permutations
>>> list(permutations([0, 1, 2]))
[
    (0, 1, 2),
    (0, 2, 1),
    (1, 0, 2),
    (1, 2, 0),
    (2, 0, 1),
    (2, 1, 0),
]
```

The first two results are `(0, 1, 2)` and `(0, 2, 1)`, which are triples built by taking `0` and putting it in front of the permutations of the list `[1, 2]`:

```pycon
>>> list(permutations([1, 2]))
[
    (1, 2),
    (2, 1),
]
>>> [(0,) + perm for perm in permutations([1, 2])]
[
    (0, 1, 2),
    (0, 2, 1),
]
```

This shows the recursive relation:

 > “The **permutations** of a list of values start with the first value appended to the **permutations** of the _rest_ of the values.

To build _all_ the permutations, instead of just the first ones, we go through the list of all original values and, for each value, we prepend it to the permutations of all the other values.
You can express this in code as such:

```py
def perm_(values):
    # If there are no values, then there are no permutations; stop.
    if not values:
        yield ()
        return

    for idx, value in enumerate(values):
        rest = values[:idx] + values[idx + 1:]
        for sub_perm in perm_(rest):
            yield (value,) + sub_perm
```
