---
themes:
    - "`dataclasses.dataclass`"
    - "`dataclasses` (module)"
    - "decorators"
    - "immutability"
---

(179)=
# 179 – Immutable dataclasses

By default, dataclasses are mutable:

```py
from dataclasses import dataclass

@dataclass
class Currency:
    name: str
    symbol: str

euro = Currency("euro", "€")
euro.name = "dollar"
print(euro)
# Currency(name='dollar', symbol='€')
```

The snippet above shows that the name of the currency `euro` was changed to `dollar`.

However, the decorator `dataclass` provides a convenient way to create immutable classes.
To do that, just set `frozen=True` in the decorator:

```py
from dataclasses import dataclass

@dataclass(frozen=True)
class Currency:
    name: str
    symbol: str

euro = Currency("euro", "€")
euro.name = "dollar"
# dataclasses.FrozenInstanceError
```

If you try to mutate an immutable dataclass you get the error `dataclasses.FrozenInstanceError`.
