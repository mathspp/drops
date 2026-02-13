---
themes:
    - "type variables"
    - "typing/type hints"
    - "`typing` (module)"
    - "protocols"
    - "`typing.Protocol`"
    - "OOP"
---

(223)=
# 223 – Protocols

A protocol lets you define a type through the methods that it requires without impacting the class hierarchy directly.
To create a protocol, you define a class that inherits from `typing.Protocol`:

```py
from typing import Protocol

class Diver(Protocol):
    def dive(self) -> None: ...
```

The class `Diver` defines that any class that implements a method `dive` with the signature `dive(self) -> None` is also a `Diver`.

A protocol can be used as a type in function signatures, for example:

```py
def go_for_a_dive(obj: Diver) -> None:
    # ...
```

Suppose that now you define the class `Penguin`:

```py
class Penguin:
    def dive(self) -> None:
        # ...
```

The class `Penguin` does _not_ inherit from `Diver`.
But since the class `Penguin` implements the method `dive`, a `Penguin` is also a `Diver`.
That's why this code would type check:

```py
go_for_a_dive(Penguin())
```
