---
themes:
    - "typing"
    - "`isinstance`"
    - "vertical bar `|`"
    - "type unions"
---

## 3 – Type unions with the vertical bar in `isinstance`

The vertical bar `|` can be used to combine types (to create type unions) since Python 3.10.
This lets you create type unions in a very ergonomic way.

You can use it, for example, inside `isinstance` checks.
This lets you check if a value belongs to one of two or more types, like so:

```py
isinstance(x, typ1 | typ2 | ...)
```

This is definitely nicer than

```py
isinstance(x, typ1) or isinstance(x, typ2) or ...
```

And it is also nicer than the traditional alternative with a tuple of types:

```py
isinstance(x, (typ1, typ2, ...))
```

Here is a complete example:

```py
def is_number(x):
    return isinstance(x, int | float | complex)

print(is_number(42))  # True
print(is_number("hey"))  # False
```
