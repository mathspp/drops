---
themes:
    - "OOP"
    - "dunder methods"
    - "`NotImplemented`"
---

(237)=
# 237 – `__eq__`

The dunder method `__eq__` implements equality comparison.
Implement it to override the default behaviour, which behaves like the keyword is and only checks for identity equality:

```py
class Coords:
    def __init__(self, x, y):
        self.x, self.y = x, y

p1 = Coords(2, 3)
p2 = Coords(2, 3)
print(p1 == p2)  # False ?!
```

If you implement `__eq__`, you can say that two objects `Coords` with the same attributes `x` and `y` are equal:

```py
class Coords:
  def __init__(self, x, y):
    self.x, self.y = x, y

  def __eq__(self, other):
    if isinstance(other, Coords):
      return self.x == other.x and self.y == other.y
    return NotImplemented

p1 = Coords(2, 3)
p2 = Coords(2, 3)
print(p1 == p2)  # True :)
```

Note that the correct way to implement `__eq__` is to return `NotImplemented` for types that you don't care about or don't know about.
