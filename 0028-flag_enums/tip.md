---
themes:
    - standard library
    - "`enum` (module)"
    - "`enum.Flag`"
---

## 28 – Flag enumerations

The module `enum` contains a type `Flag` that you can use for enumerations that should support the Boolean operations `&` (AND), `|` (OR), `^` (XOR), and `~` (INVERT):

```py
from enum import Flag, auto

class Color(Flag):
    RED = auto()
    GREEN = auto()
    BLUE = auto()

# Purple is red with blue:
purple = Color.RED | Color.BLUE
```

Flag enumerations also support other useful operations, like containment check:

```py
# Is the flag GREEN set?
print(Color.GREEN in purple)  # False
```

In Python 3.11+, you can also get a list of the individual flags that are set:

```py
# What flags is `purple` composed of?
print(list(purple))  # [<Color.RED: 1>, <Color.BLUE: 4>]
```
