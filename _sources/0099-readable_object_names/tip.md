---
themes:
    - "dunder attributes"
    - "`__name__`"
    - "inheritance"
    - "OOP"
---

(99)=
# 99 – Readable object names

Functions and classes have a dunder attribute `__name__` that is a string with the readable/user-defined name of that object:

```py
class Example:
    pass

print(Example.__name__)  # Example
print(int.__name__)  # int
```

```py
def foo():
    pass

print(foo.__name__)  # foo
print(print.__name__)  # print
```

This is useful, for example, when defining a class's `__repr__`:

```py
class Point:
    def __init__(self, x):
        self.x = x
        
    def __repr__(self):
        return f"{type(self).__name__}({self.x})"
```

By using the dunder attribute `__name__`, the implementation of `__repr__` will remain correct if the name of the class changes and it is also more likely to stay correct if `Point` is subclassed.
