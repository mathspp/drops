---
themes:
    - "`dataclasses` (module)"
    - "`dataclasses.dataclass`"
    - "`dataclasses.field`"
    - "decorators"
    - "`__post_init__`"
---

(250)=
# 250 – Post initialisation in data classes

Data classes have a mechanism that allows you to specify custom (post) initialisation code without having to override the dunder method `__init__` that the decorator `@dataclass` creates.

Take a look at the class `Student` defined below:

```py
from dataclasses import dataclass, field

@dataclass
class Student:
    name: str
    grades: list[int]
    avg: float = field(default=0, init=False)
    
    def __post_init__(self):
        self.avg = sum(self.grades) / len(self.grades)
```

The attribute `avg` is set to _not_ be an attribute that's specified when instantiating the class `Student`.
Instead, the attribute is computed from the list `grades` during post initialisation.

The method `__post_init__` is called automatically after the dunder method `__init__` runs, so `self.grades` has been assigned yet but the user hasn't had the chance to inspect the instance and realise the value of `avg` is not correct.

Here's an example instantiation of the class `Student`:

```py
john = Student("John", [3, 4, 4, 4])
print(john.avg)  # 3.75
```

Note how the average `3.75` was not passed to the call to `Student` and yet the attribute `avg` has the correct value.
