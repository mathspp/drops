---
themes:
    - "`dataclasses` (module)"
    - "`dataclasses.dataclass`"
    - "`dataclasses.field`"
---

(220)=
# 220 – Orderable dataclasses

By default, dataclass instances are not orderable:

```py
from dataclasses import dataclass

@dataclass
class Task:
    priority: int
    description: str

Task(1, "task 1") < Task(2, "task 2")
# TypeError
```

Trying to compare two instances of the class `Task` raises a `TypeError`.

Set the parameter `order=True` in the `dataclass` decorator to make your dataclasses automatically orderable based on its attributes:

```py
from dataclasses import dataclass, field

@dataclass(order=True)
class Task:
    priority: int
    description: str = field(compare=False)

Task(1, "task 1") < Task(2, "task 2")
# True
```

By setting `order=True` you can order instances of `Task` based on the attributes `priority` and `description`.
By setting `compare=False` in `field`, you exclude `description` from the comparisons.
