---
themes:
    - "immutability"
    - "inheritance"
    - "`__new__`"
    - "`__init__`"
    - "OOP"
---

(58)=
# 58 – Subclassing immutable types

How do you subclass immutable types?
(For example, how would you subclass floats?)

The dunder method `__init__` alone isn't enough; you need something else...

You need the dunder method `__new__`, `__init__`'s big brother.
The dunder method `__new__` is a class method that is responsible for creating the object, whereas `__init__` simply initialises/customises it.

Here is the skeleton for a float subclass:

```py
class FloatSubclass(float):
    def __new__(cls, value, *args, **kwargs):
        print("__new__", value, args, kwargs)
        return super().__new__(cls, value)

    def __init__(self, value, *args, **kwargs):
        print("__init__", value, args, kwargs)
        # Do whatever with the args and kwargs

x = FloatSubclass(4.5)
# __new__ 4.5 ('hello',) {'foo': True}
# __init__ 4.5 ('hello',) {'foo': True}
print(x)  # 4.5 <- looks like a float.
```

Further reading:

 - [Customising object creation with `__new__`](https://mathspp.com/blog/customising-object-creation-with-__new__).
