---
themes:
    - type hints
    - standard library
    - "`typing` (module)"
    - "`typing.Literal`"
---

## 29 – Use `Literal` for options

Use the type `Literal` from the module `typing` when a function accepts a small number of specific values that represent configurations or options.

For example, instead of

```py
def get_temperature(city: str, unit: str) -> float: ...
```

you can do

```py
from typing import Literal

def get_temperature(
    city: str,
    unit: Literal["celsius", "fahrenheit"],
) -> float:
    ...
```

You would still use the function with the plain strings:

```py
print(get_temperature("Lisbon", "celsiu"))  # 18.0
print(get_temperature("Lisbon", "fahrenheit"))  # 64.4
```

One of the side-benefits of using the type `Literal` is that you're documenting the valid values.
