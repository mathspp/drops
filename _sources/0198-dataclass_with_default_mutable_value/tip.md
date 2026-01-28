---
themes:
    - "`dataclasses` (module)"
    - "defensive programming"
    - "`dataclasses.dataclass`"
    - "`dataclasses.field`"
---

(198)=
# 198 – Data class with default mutable value

If you try to set a data class field to a mutable value, you get an error:

```py
from dataclasses import dataclass

@dataclass
class Error:
    lineno: int
    error_type: str
    notes: list[str] = []
```
```text
ValueError: mutable default <class 'list'> for field notes is not allowed: use default_factory
```

The decorator `dataclass` validates each field in your data class and it preemptively throws an error when it sees the list `[]` being used as the default value for the field `notes`.
The reason you get the error is because it is _highly_ likely that your code will have bugs if the error wasn't raised.

The correct way to have a list be the default value is by using `dataclasses.field` and the parameter `default_factory`:

```py
from dataclasses import dataclass, field

@dataclass
class Error:
    lineno: int
    error_type: str
    notes: list[str] = field(
        default_factory=list
    )
```

The parameter `default_factory` accepts a zero-argument function that is called whenever you need to populate your field with a default.
