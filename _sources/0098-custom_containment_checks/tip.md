---
themes:
    - "dunder methods"
    - "`__contains__`"
---

(98)=
# 98 – Custom containment checks

The [dunder method](https://mathspp.com/blog/pydonts/dunder-methods) `__contains__` can be used to implement custom containment checks in your classes.
This will allow instances of your classes to be used with the keywords `in` and `not in`.

As an example, consider the class `ClosedInterval` shown below, that represents all numbers between the left and right boundaries, inclusive:

```py
class ClosedInterval:
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def __contains__(self, value):
        return self.left <= value <= self.right
```

By defining the dunder method `__contains__`, instances of `ClosedInterval` can be used with `in` and `not in`:

```py
interval = ClosedInterval(2.7, 4.5)

print(3 in interval)  # True
print(7 in interval)  # False
print(7 not in interval)  # True
```

The dunder method `__contains__` accepts the value that is being checked as its only argument and must return a Boolean value that must be `True` if the argument is contained in the instance and `False` if not.
