---
themes:
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.Self`"
    - "OOP"
    - "standard library"
---

(206)=
# 206 – `typing.Self`

When a method returns the argument `self`, use `typing.Self` to annotate the return type of the method:

```py
from typing import Self

class SomeClass:
    def some_method(self) -> Self:
        ...
        return self
```

This is especially useful if `AnotherClass` inherits from `SomeClass`:

```py
class AnotherClass(SomeClass):
    pass
```

Because of `Self`, the return type of `AnotherClass.some_method` is inferred to be the subclass itself:

```py
from typing import reveal_type

reveal_type(AnotherClass().some_method())  # AnotherClass
```

If you didn't use `Self`, the return type would be the parent class:

```py
from typing import reveal_type

class SomeClass:
    def some_method(self) -> SomeClass:
        ...
        return self

class AnotherClass(SomeClass):
    pass

reveal_type(AnotherClass().some_method())  # SomeClass ?!
```
