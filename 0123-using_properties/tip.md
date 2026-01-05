---
themes:
    - "OOP"
    - "decorators"
    - "`property`"
---

## 123 – Using properties

The built-in decorator `property` can be used to turn a method into an attribute.
This means that properties look like attributes but actually run methods that compute the values that must be returned.

Useful, for example, if you have something that “looks” like an attribute but needs to be computed dynamically, like someone's age based on their birthdate:

```py
import datetime as dt

class Person:
    def __init__(self, name, birth_date):
        self.name = name
        self.birth_date = birth_date
        
    @property
    def age(self):
        y, m, d, *_ = dt.date.today().timetuple()
        by, bm, bd = self.birth_date
        return y - by - ((bm, bd) > (m, d))


john = Person("John", (1990, 8, 28))

# 27th August, 2025, it's John's birthday tomorrow
print(john.age)  # 34

# time.sleep(1 day)

# 28th August, 2025, it's John's 35th birthday
print(john.age)  # 35
```

Note how `Person.age` is implemented as a method, but because of the decorator `property`, it's accessed as an attribute.

Further reading:

 - [Properties](https://mathspp.com/blog/pydonts/properties)
