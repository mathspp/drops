---
themes:
    - "built-ins"
    - "`vars`"
    - "`dir`"
    - "OOP"
    - "debugging"
---

(235)=
# 235 – `vars` and `dir`

Suppose you have an object from a class `Person` you defined:

```py
class Person:
    flag = True  # Class attribute.

    def __init__(self, name):
        self.name = name

    def greet(self):
        return f"Hello, {self.name}"

john = Person("John Smith")
```

You can use the built-in `vars` to inspect the attributes of the object `john`, which in this case is just the attribute `name`:

```pycon
>>> vars(john)
{'name': 'John Smith'}
```

`greet` is a method, so it isn't shown, and `flag` is a class attribute, not an attribute that's defined directly on the object `john`, although `john.flag` is naturally `True`:

```py
print(john.flag)  # True
```

If you use the built-in `dir`, then you get a list of all attributes and methods that you can access through that object, including things like class attributes and methods that were inherited:

```pycon
>>> dir(john)
[
    '__class__',   # A long list of special
    ...,           # methods and attributes
    '__weakref__,  # inherited from `object`.
    'flag',        # The class attribute.
    'greet',       # The method.
    'name'         # The instance attribute.
]
```

Both built-ins are useful in debugging scenarios.

Further reading:

 - ICPO rule for attribute lookup, <https://mathspp.com/blog/til/003>
 - `vars`, <https://mathspp.com/blog/til/009>
