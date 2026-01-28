---
themes:
    - "decorators"
    - "`warnings` (module)"
    - "`warnings.deprecated`"
---

(183)=
# 183 – Deprecation warnings

Use the decorator `warnings.deprecated` to issue a deprecation warning when certain functions, methods, or classes are used:

```py
from warnings import deprecated

@deprecated("Use bar instead.")
def foo():
    pass

def bar():
    pass

foo()
# DeprecationWarning: Use bar instead.
```

The code above shows that calling `foo` will issue a deprecation warning, since the function `foo` was decorated with the decorator `deprecated`.

Similarly, you can apply the decorator `deprecated` to a class:

```py
from warnings import deprecated

@deprecated("Use D instead.")
class C:
    pass
    
class D:
    pass
    
c = C()
# DeprecationWarning: Use D instead.
```
