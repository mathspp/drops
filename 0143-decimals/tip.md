---
themes:
    - "mathematics"
    - "floats"
    - "`decimal` (module)"
    - "standard library"
---

## 143 – Decimals

[Fractions are very useful](#using-fractions) but sometimes it is not very helpful to compute `1 / 7` and get `1/7` as a result...

Instead, you may want to use the module `decimal` and its class `decimal.Decimal` to compute fast, correctly-rounded floating-point arithmetic:

```py
from decimal import Decimal

print(1.1 + 2.2)  # 3.3000000000000003

d = Decimal("1.1") + Decimal("2.2")
print(d)  # 3.3
print(repr(d))  # Decimal('3.3')
```

One good thing about the module `decimal` is that you can set the precision (number of decimal places) with which results are computed:

```py
from decimal import getcontext

getcontext().prec = 6
print(Decimal(1) / Decimal(7))  # 0.142857

getcontext().prec = 28
print(Decimal(1) / Decimal(7))  # 0.1428571428571428571428571429
```
