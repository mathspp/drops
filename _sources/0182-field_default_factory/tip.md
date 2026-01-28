---
themes:
    - "defensive programming"
    - "`dataclasses` (module)"
    - "`dataclasses.dataclass`"
    - "`dataclasses.field`"
---

(182)=
# 182 – Field default factory

Default mutable values create all kinds of problems, so using a mutable value as a default for a data class attribute raises an error:

```py
from dataclasses import dataclass

@dataclass
class Exercise:
    name: str
    reps: int
    notes: list[str] = []  # Wrong!
# ValueError
```

The correct way to set the attribute `notes` to have an empty list by default is by using `dataclasses.field`:

```py
from dataclasses import dataclass, field

@dataclass
class Exercise:
    name: str
    reps: int
    notes: list[str] = field(  # Right!
        default_factory=list
    )
```

The parameter `default_factory` can be set to a callable that should take no arguments.
The callable is called _each time_ the default value is needed.
