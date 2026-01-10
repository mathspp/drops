---
themes:
    - "`classmethod`"
    - "class methods"
    - "OOP"
    - "decorators"
    - "unpacking"
    - "asterisk `*`"
---

(138)=
# 138 – Alternative constructors as class methods

A common use case for class methods is to provide alternative constructors for classes.
([An example from the built-ins is `dict.fromkeys`](114).)

A class method accepts the class as its first argument, not `self`.
(Otherwise, it would be an instance method and not a class method.)

```py
class Person:
    def __init__(self, first, last):
        self.first = first
        self.last = last

    @classmethod
    def from_name(cls, name):
        return cls(*name.split())
```

The class method `from_name` lets you create instances of the class `Person` by passing the full name directly:

```py
john = Person.from_name("John Smith")

print(type(john))  # <__main__.Person object at 0x103a26e40>
print(john.first)  # John
print(john.last)  # Smith
```
