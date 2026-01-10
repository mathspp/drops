---
themes:
    - "structural pattern matching"
    - "`__match_args__`"
    - "OOP"
---

(75)=
# 75 – Match the structure of custom objects

Custom objects can have their structure matched by specifying the relevant attribute names in the dunder attribute `__match_args__`.

This dunder attribute must be a tuple of strings that specifies the attribute names used for matching.
The object can have more attributes, but the ones that aren't included in `__match_args__` are irrelevant for the purposes of structural pattern matching.

For example, the class `Point` below has three attributes but the dunder attribute `__match_args__` only refers two:

```py
class Point:
    __match_args__ = ("x", "y")

    def __init__(self, x, y, z):
        self.x, self.y = x, y
        self.z = z

p = Point(1, 2, 3)
```

When trying to match the structure of an instance of `Point`, you can match directly against the attributes `x` and `y`:

```py
p = Point(1, 2, "")
match p:
    case Point(1, int()):
        print("match!")
# match!
```

Note how the case statement with the pattern `Point(1, int())` _looks_ like an instantiation of the class `Point`, although that is not valid code for the purposes of class instantiation.
It is valid code for the purposes of structural pattern matching, though.

Further reading:

 - [Structural pattern matching tutorial](https://mathspp.com/blog/pydonts/structural-pattern-matching-tutorial).
 - [Structural pattern matching cheatsheet](https://mathspp.gumroad.com/l/cheatsheet_match_statement?layout=profile).
