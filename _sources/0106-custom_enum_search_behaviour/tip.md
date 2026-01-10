---
themes:
    - "standard library"
    - "`enum` (module)"
    - "`_missing_`"
    - "`classmethod`"
    - "class methods"
---

(106)=
# 106 – Custom `enum` search behaviour

Similar to the dunder method `__missing__`, enumerations can have a class method `_missing_` (with a single underscore).

This class method is called when instantiating an enumeration with a value that’s not legal.
The class method can implement custom search behaviour (e.g., error-tolerant search) to try and find/return the correct member.

As a silly example, the enum shown below uses a naive strategy to try and suppress a common difference between UK and US English spelling:

```py
from enum import auto, StrEnum

class Proximity(StrEnum):
    NEIGHBOR = auto()
    DISTANT = auto()
    
    @classmethod
    def _missing_(cls, value):
        try_value = value.casefold().replace("ou", "o")
        for member in cls:
            if member.value.casefold() == try_value:
                return member
        return None
```

Here's `_missing_` in action:

```py
#                      vv
print(Proximity("NEIGHBOUR"))
# <Proximity.NEIGHBOR: 'neighbor'>
#                  ^          ^
```
