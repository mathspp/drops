---
themes:
    - "exceptions"
    - "3.15 (new in Python 3.15)"
---

(252)=
# 252 – Nested attribute access exception

When trying to access a nested attribute from the outer object, starting from Python 3.15 you'll get a helpful error message suggesting a fix.

Consider the classes `Outer` and `Inner`:

```py
class Inner:
    def __init__(self, value):
        self.value = value

class Outer:
    def __init__(self, value):
        self.inner = Inner(value)
```

Objects of type `Outer` have an attribute `inner` that is an instance of type `Inner` that contains an attribute `value`.

If you try to access the attribute `value` from an instance of `Outer`, you get a generic `AttributeError` exception:

```py
# Python 3.14 and earlier
o = Outer()
print(o.value)
```
```pycon
Traceback (most recent call last):
  File "<python-input-2>", line 1, in <module>
    print(o.value)
          ^^^^^^^
AttributeError: 'Outer' object has no attribute 'value'
```

Starting from Python 3.15, Python suggests the correct nested attribute lookup:

```py
# Python 3.15+
o = Outer()
print(o.value)
```
```pycon
Traceback (most recent call last):
  File "<python-input-1>", line 2, in <module>
    print(o.value)
          ^^^^^^^
AttributeError: 'Outer' object has no attribute 'value'. Did you mean '.inner.value' instead of '.value'?
```
