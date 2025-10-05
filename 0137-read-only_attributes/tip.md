---
themes:
    - "`property`"
    - "OOP"
    - "built-ins"
    - "decorators"
---

## 137 – Read-only attributes

The standard way of creating read-only attributes in Python is by creating a “private” attribute and then exposing it through a property:

```py
class Person:
    def __init__(self, name):
        self._name = name

    @property
    def name(self):
        return self._name
```

This way, the property is read-only:

```py
john = Person("John")

print(john.name)  # John
john.name = "Steve"  # AttributeError
```

However, the underlying “private” attribute is still accessible and could be modified:

```py
john._name = "Steve"
print(john.name)  # Steve
```
