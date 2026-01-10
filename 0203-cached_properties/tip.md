---
themes:
    - "`property`"
    - "`vars`"
    - "`functools`"
    - "`functools.cached_property`"
    - "caching"
    - "performance optimisation"
    - "decorators"
---

(203)=
# 203 – Cached properties

You can use `functools.cached_property` to create a property that is computed once and then cached for the lifetime of the instance where it is defined.
This is a good approach for attributes that are expensive to compute because it defers the cost of computing them to as late as possible.
If the attribute is never needed, you never have to compute it.

Here's an example usage:

```py
from functools import cached_property
from math import sqrt

class Int:
    def __init__(self, n):
        self.value = n

    @cached_property
    def is_prime(self):
        if not self.value % 2:
            return False
        div, stop = 3, sqrt(self.value)
        while div <= stop:
            if not self.value % div:
                return False
            div += 2
        return True
```

To see it in action, you can create an instance of `Int` with a large-enough prime number:

```py
# 10000000000th prime:
i = Int(252097800623)

print(vars(i))  # {'value': 252097800623}

print(i.is_prime)  # True

print(vars(i))
# {'value': 252097800623,
# 'is_prime': True}

print(i.is_prime)  # True
```

The snippet above also shows that the cached property will set an attribute with the same name on the instance.
While it's there, checking `i.is_prime` will access the attribute directly instead of running the property.
If you delete the attribute with `del i.is_prime`, then you can force the cached property to run again.
