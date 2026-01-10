---
themes:
    - "dictionaries"
    - "standard library"
    - "`collections` (module)"
    - "`collections.defaultdict`"
---

(37)=
# 37 – Multi-dictionary

You can create a multi-dictionary in Python with `collections.defaultdict` and the built-in `list` with `multidict = collections.defaultdict(list)`:

```py
from collections import defaultdict

multidict = defaultdict(list)
```

This creates a dictionary that maps every single key to an empty list by default, which is why you use `defaultdict` in the first place:

```py
print(multidict["SW"])  # []
print(multidict["LotR"])  # []
```

Then, when you want to “add a value to a key”, you instead append to the list mapped to by that key:

```py
multidict["SW"].append("Han Solo")
multidict["SW"].append("R2D2")
print(multidict["SW"])  # ['Han Solo', 'R2D2']
```

However, it goes without saying that this is “cheating”: the dictionary still maps each key to a single list.
You're just leveraging the fact that lists can store multiple values in them to.

Further reading:

 - [Module `collections` overview](https://mathspp.com/blog/module-collections-overview)
