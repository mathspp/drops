---
themes:
    - "`dataclasses` (module)"
    - "`dataclasses.dataclass`"
    - "OOP"
    - "boilerplate"
    - "dunder methods"
    - "`__repr__`"
    - "`__eq__`"
    - "`__name__`"
    - "`NotImplemented`"
    - "decorators"
---

## 139 – Reduce boilerplate with dataclasses

The module `dataclasses` provides a decorator `dataclass` that you're supposed to use on classes.
The decorator `dataclass` reduces the need to write boilerplate code by adding the dunder methods `__init__`, `__eq__`, and `__repr__`, to the class that is decorated.

To create a dataclass, all you need is to define the attributes that are relevant by listing them in the class body along with an annotation of their type:

```py
from dataclasses import dataclass

@dataclass
class Person:
    first: str
    last : str
```

The four lines of code that define the class `Person` as a dataclass are roughly equivalent to the following handwritten definition:

```py
class Person:
    def __init__(self, first, last):
        self.first = first
        self.last = last

    def __eq__(self, other):
        if isinstance(other, Person):
            return self.first == other.first and self.last == other.last
        return NotImplemented

    def __repr__(self):
        cls = type(self).__name__
        return f"{cls}(first={self.first!r}, last={self.last!r})"
```
