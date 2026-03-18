---
themes:
    - "3.15 (new in Python 3.15)"
    - "recursion"
    - "structural pattern matching"
    - "`*` (asterisk)"
---

(249)=
# 249 – Recursive structural pattern matching

You can traverse nested data structures by using structural pattern matching recursively, like in the example below:

```py
def flatten(obj):
    match obj:
        case list(values):
            return [*flatten(v) for v in values]
        case _:
            return [obj]
```

When called with a list that is deeply nested and lacking uniform structure, the nesting is successively unravelled by the recursive calls and pattern matching is used to detect the structural base case(s):

```py
flat = flatten(
  [
    [
      [1, 2],
      [3, 4],
      [
        [5],
        [6]
      ]
    ],
    [7, 8]
  ]
)
print(flat)  # [1, 2, 3, 4, 5, 6, 7, 8]
```

Note that the current implementation of `flatten` uses [unpacking inside comprehensions](248), which is a feature that is new in Python 3.15.

Further reading:

 - Recursive structural pattern matching, <https://mathspp.com/blog/recursive-structural-pattern-matching>
