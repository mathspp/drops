---
themes:
    - "conventions"
    - "naming"
    - "underscore `_`"
    - "OOP"
---

(167)=
# 167 – Private members

Python has a very well-known naming convention: names that start with a leading underscore `_` are considered “private”.

This means the outside world has no business using them.
For example, attributes and methods starting with `_` in a class mean they're for that class only.
When that happens, it's common to see other methods of the class use those private names, like is the case for `drive`/`_start_engine` in the class `Car`:

```py
class Car:
    def __init__(self, ...):
        self._serial_number = ...

    def _start_engine(self): ...

    def drive(self):
        self._start_engine()
        ...
```

Sometimes, private attributes/methods are still used inside the same module:

```py
def _validate_serial_number(serial_no):
    ...

def inspect_car(workshop, car):
    if not _validate_serial_number(car._serial_number):
        ...
```

But if you're importing someone else's code, you should be very careful about using objects whose name starts with an underscore `_`.
