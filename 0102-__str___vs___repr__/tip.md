---
themes:
    - "dunder methods"
    - "`__str__`"
    - "`__repr__`"
    - "OOP"
    - "I/O"
    - "pretty printing"
    - "debugging"
---

## 102 – methods `__str__` and `__repr__`

Objects can use two different dunder methods to create string representations for themselves:

 - `__str__`
 - `__repr__`

`__str__` is supposed to provide a “pretty” string representation and `__repr__` is supposed to provide a “debug” string representation.

If `Point` is a class used to represent a point in 3D space, here's what its implementations of `__str__` and `__repr__` could be:

```py
class Point:
    def __init__(self, x, y, z):
        self.x, self.y, self.z = x, y, z

    def __str__(self):
        return f"({self.x}, {self.y}, {self.z})"

    def __repr__(self):
        return f"Point({self.x}, {self.y}, {self.z})"
```

When using the built-in `print`, the pretty string representation (`__str__`) is used:

```py
print(Point(1, 2, 3))  # (1, 2, 3)
```

When using the built-in `repr`, the formatter `!r` inside f-strings, or when instances of the class `Point` are inside other containers, the debugging string representation (`__repr__`) is used:

```py
some_points = [Point(0, 0, 0), Point(1, 2, 3)]
print(some_points)  # [Point(0, 0, 0), Point(1, 2, 3)]
```

As a good rule of thumb, you should be able to copy & paste the output of `__repr__` to recreate the object.
Also, when in doubt, implement `__repr__`.
I personally rarely implement `__str__`, and when `__repr__` is present, `__str__` falls back to `__repr__`.

Further reading:

 - [`str` and `repr`](https://mathspp.com/blog/pydonts/str-and-repr)
