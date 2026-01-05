---
themes:
    - "`NotImplemented`"
    - "dunder methods"
    - "OOP"
---

## 145 – `NotImplemented`

The singleton built-in `NotImplemented` has one and only one very specific use case: binary dunder methods return this value when they don't know how to compute the result of the operation between the two given arguments.

In other words, the only correct way of implementing a binary dunder method is to return `NotImplemented` after handling all the cases you know and care about.

Here is an example with a class `Person`:

```py
class Person:
    def __init__(self, name):
        self.name = name

    def __eq__(self, other):
        if isinstance(other, Person):
            return self.name == other.name
        return NotImplemented
```

One might think that the correct thing to do is to return `False` in `Person.__eq__` after concluding that `other` isn't an instance of `Person`, but that precludes you and others from writing classes in the future that can compare to `Person`.

For example, suppose the class `Employee` is implemented at a later date and it's independent of the class `Person`.
Employees will only be comparable to persons if `return NotImplemented` is used in `Person.__eq__`:

```py
class Employee:
    def __init__(self, name):
        self.name = name

    def __eq__(self, other):
        if isinstance(other, Person | Employee):
            return self.name == other.name
        return NotImplemented

print(Person("John") == Employee("John"))  # True
```

Give it a try.
Replace the final `return` of `Person.__eq__` with `return False` and note how the value that is printed becomes `False` instead of `True`.

`NotImplemented` should not be confused with [the built-in exception `NotImplementedError`](#notimplementederror).
