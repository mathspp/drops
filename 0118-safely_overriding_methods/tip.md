---
themes:
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.overrides`"
    - "OOP"
    - "standard library"
---

## 118 – Safely overriding methods

The decorator `typing.overrides` can be used to mark that a method is overriding a method from a parent class.
If it isn't, type checkers will complain.

Here's an example super class that implements two methods `sound` and `sleep`:

```py
class Animal:
    def sound(self) -> str:
        ...

    def sleep(self) -> None:
        ...
```

Suppose you want to override this class to create a class `Cat`:

```py
from typing import overrides

class Cat(Animal):
    @overrides
    def sound(self) -> str:
        ...
        
    @overrides
    def seep(self) -> None
        ...
```

A type checker will see that `Cat.sound` and `Cat.seep` are supposed to be overrides of methods from the parent class(es).
Since a type checker won't find a method `seep` in a parent class (because it's supposed to be “`sleep`”, with an extra L), you will get an error and you'll easily spot your typo.

Using `overrides` is also useful if you're inheriting from parent classes from other packages, since it will let you know if a method name changes; for example, if the API changes in a version upgrade.
