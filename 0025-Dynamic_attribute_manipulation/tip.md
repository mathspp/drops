---
themes:
    - "dynamic code"
    - "`getattr`"
    - "`setattr`"
    - "`delattr`"
---

## 25 – Dynamic attribute manipulation

The built-ins `getattr`, `setattr`, and `delattr`, can be used to manipulate attributes dynamically.

Whenever possible, you will want to use the dot syntax to access attributes, set attributes, and delete attributes, but these dynamic functions can be used when you have the name of the attribute you want to work with as a string that you computed programmatically.

The built-in `setattr` accepts the object you want to set an attribute on, the attribute name as a string, and the value the attribute will be set to:

```py
class Colour:
    pass

c = Colour()
setattr(c, "r", 255)  # c.r = 255
setattr(c, "g", 125)  # c.g = 125
setattr(c, "b", 0)    # c.b = 0
```

The built-in `getattr` accepts the object you want to get an attribute from and the attribute you want to fetch.
Typically, you will have the attribute name in a variable:

```py
attr = "g"
print(getattr(c, attr))  # 125
print(c.g)               # 125
```

If you use the built-in `getattr` to access an attribute that isn't there, you get an exception `AttributeError`.
Alternatively, you can pass in a third argument to `getattr`:

```py
print(getattr(c, "x", "heh"))  # heh
```

Finally, the built-in `delattr` will take the given object and delete the attribute specified from it:

```py
delattr(c, "g")
print(c.g)  # AttributeError
```
