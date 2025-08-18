---
themes:
    - "naming"
    - "underscore `_`"
    - "OOP"
    - "defensive programming"
    - "mix-ins"
---

## 115 – Double leading underscore

Name mangling is a Python feature that mangles the names of attributes and methods of functions that start with a leading double underscore, like `__value`.

Attributes/methods like this are accessible with their original name from inside the class:

```py
class MyClass:
    def __init__(self):
        self.__value = 42

    def print_value(self):
        print(self.__value)

c = MyClass()
c.print_value()  # 42
```

From outside the class, attributes/methods have their names mangled with a leading underscore `_` and the name of the class:

```py
print(c.__value)  # AttributeError
#       vvvvvvvv mangled
print(c._MyClass__value)  # 42
```

This feature is not supposed to be used to create “private” attributes, since the attributes are still public.
This is intended in OOP contexts like when writing mix-ins, to make it virtually impossible for attributes/methods to be overridden by mistake.
