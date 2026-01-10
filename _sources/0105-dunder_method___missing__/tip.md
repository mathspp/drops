---
themes:
    - "dunder methods"
    - "`__missing__`"
    - "OOP"
    - "dictionaries"
    - "`collections.defaultdict`"
---

(105)=
# 105 – Dunder method `__missing__`

The dunder method `__missing__` is part of the `dict` data model.
If you look up a key that isn’t in the dictionary, `__missing__` is called to let you handle the missing key.

```py
class Test(dict):
    def __missing__(self, key):
        print(f"In __missing__ with {key = }.")

d = Test()
d[42]  # Output: In __missing__ with key = 42.
```

This can be used, for example, to implement `collections.defaultdict` yourself:

```py
class defaultdict_(dict):
    def __init__(self, factory, **kwargs):
        super().__init__(**kwargs)
        self.default_factory = factory

    def __missing__(self, key):
        """Populate the missing key and
        return its value."""
        self[key] = self.default_factory()
        return self[key]

# int() gives 0.
olympic_medals = defaultdict_(int)
olympic_medals["Phelps"] = 28

print(olympic_medals["Phelps"])  # 28
print(olympic_medals["me"])  # 0 :(
```

Further reading:

 - [Module `collections` overview](https://mathspp.com/blog/module-collections-overview)
