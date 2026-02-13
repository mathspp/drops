---
themes:
    - "typing/type hints"
    - "`typing.Protocol`"
    - "protocols"
    - "OOP"
    - "type variables"
---

(225)=
# 225 – Protocols and bounded type variables

Type variables can be bound to a given type to only allow the type and its subclasses.
This is especially useful when used with protocols:

```py
from typing import Protocol

class Diver(Protocol):
    def dive(self) -> None: ...

class Penguin:
    def dive(self) -> None: ...
```

The class `Penguin` satisfies the protocol `Diver`.
Now, a function that uses the protocol `Diver` as the type for an argument can accept penguins:

```py
def proto(obj: Diver) -> Diver:
    # ...
    obj.dive()
    # ...
    return obj
```

However, since the function is typed to return a `Diver`, you lose information about the return value even knowing you're returning the same argument you passed in:

```py
p = Penguin()
reveal_type(p)  # Penguin
reveal_type(proto(p))  # Diver
```

On the other hand, you can bind a type variable to the protocol and use it instead:

```py
def tvar[D: Diver](obj: D) -> D:
    # ...
    obj.dive()
    # ...
    return obj
```

The notation `[D: Diver]` says that the type variable `D` is only good for the class `Diver` and its subclasses, which incidentally are the classes that satisfy the protocol.
This preserves all the information:

```py
p = Penguin()
reveal_type(p)  # Penguin
reveal_type(tvar(p))  # Penguin
```
