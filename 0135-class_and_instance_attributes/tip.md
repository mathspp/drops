---
themes:
    - "typing/type hints"
    - "OOP"
    - "`typing` (module)"
    - "`typing.ClassVar`"
---

## 135 – Class and instance attributes

In a typed project, you can specify the types of (instance) attributes by declaring them all in the body of the class (just like dataclasses do):

```py
class Person:
    name: str
    ...

p = Person()
p.name = "Steve"  # Type checks.
p.name = 73       # Type error.
```

But if you want to declare a class attribute (one that shouldn't be modified from any instance) then you must use `typing.ClassVar` to distinguish from a normal instance attribute:

```py
from typing import ClassVar

class Person:
    species: ClassVar[str] = "Homo sp"
    name: str
    ...

Person.species = "Homo sapiens"  # Type checks.
p = Person()
p.species = "..."  # Can't modify class attribute from instance.
p.name = "Steve"  # Still an instance attribute.
```
