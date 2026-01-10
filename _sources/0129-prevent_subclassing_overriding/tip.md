---
themes:
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.final`"
    - "OOP"
    - "decorators"
---

(129)=
# 129 – Prevent subclassing/overriding

The decorator `typing.final` (lowercase **f**) can be used to mark classes that shouldn't be subclassed:

```py
from typing import final

@final
class Base:
    pass

class C(Base):  # Type checkers will complain.
    pass
```

The decorator can also be used to mark methods that shouldn't be overridden by subclasses:

```py
from typing import final

class Base:
    @final
    def foo(self) -> None:
        pass

class C(Base):  # This is fine...
    def foo(self) -> None:  # But a type checker will complain here.
        pass
```
