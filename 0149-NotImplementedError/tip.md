---
themes:
    - "built-ins"
    - "exceptions"
    - "OOP"
    - "abstract base classes"
    - "inheritance"
---

## 149 – `NotImplementedError`

The built-in exception `NotImplementedError` is supposed to be used in base classes to indicate that a given method must be implemented by the derived class:

```py
class Parser:
    def parse(self, data):
        raise NotImplementedError
```

You can also use the exception `NotImplementedError` to create a stub for a method but also signal that its real implementation still needs to be added:

```py
class MyParser(Parser):
    def parse(self, data):
        self._validate_data(data)
        # Parse the data...
        
    def _validate_data(self, data):
        raise NotImplementedError
```

The documentation also notes that you should **not** use `NotImplementedError` to indicate that a method isn't supposed to be supported at all by a (sub)class.

`NotImplementedError` should not be confused with [the built-in singleton `NotImplemented`](#notimplemented).
