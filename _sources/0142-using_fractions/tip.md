---
themes:
    - "mathematics"
    - "floats"
    - "`fractions` (module)"
    - "standard library"
---

(142)=
# 142 – Using fractions

Floats are a bit annoying when you have to do computations because of the inaccuracies inherent to their representation.

For example, `49 * (1 / 49)` should be `1.0`, but Python gives you a different result:

```py
print(49 * (1 / 49))  # 0.9999999999999999
```

(In all fairness, most programming languages agree with Python here.)

In situations like this, if precision is important, you can use `fractions.Fraction` to perform 100% accurate computations and therefore having no errors or inaccuracies in your results:

```py
from fractions import Fraction

print(49 * Fraction(1, 49))  # 1
```

Note, however, that arithmetic operations performed between fractions or integers and fractions return other fractions:

```py
f = 43 + Fraction(1, 49)
print(f)  # 2108/49
print(repr(f))  # Fraction(2108, 49)
```

But operations between fractions and floats produce floats:

```py
print(49.0 * Fraction(1, 49))  # 0.9999999999999999
```
