---
themes:
    - "match statement"
    - "vertical bar `|`"
---

## 14 – Multiple options in a single `case` statement

Structural pattern matching lets you specify multiple options in the same `case` statement.

You separate the multiple options with a vertical bar `|`.
Here is an example:

```py
def walk(direction):
    match direction:
        case NORTH | UP:
            return (0, -1)
        ...
```

Further reading:

 - [Structural pattern matching tutorial](https://mathspp.com/blog/pydonts/structural-pattern-matching-tutorial)
