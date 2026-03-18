---
themes:
    - "`hash`"
    - "hashing"
    - "OOP"
    - "dunder methods"
    - "`__hash__`"
---

(246)=
# 246 – Custom hashable objects

An object can be made hashable if you implement the dunder method `__hash__`.
When you do, a common way to implement `__hash__` is by building a tuple with the object's attributes and then hashing that:

```py
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __hash__(self):
        return hash( (self.name, self.age) )
        
    def __eq__(self):
        ...
```

Whenever you implement `__hash__`, make sure to implement `__eq__` as well, otherwise you'll get inconsistent behaviour.
