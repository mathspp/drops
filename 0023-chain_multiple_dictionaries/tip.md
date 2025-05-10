---
themes:
    - "dictionaries"
    - "standard library"
    - "`collections` (module)"
    - "`collections.ChainMap`"
---

## 23 – Chain multiple dictionaries

You can use the object `ChainMap` from the module `collections` to create a unified view over a hierarchy of dictionaries.
The `ChainMap` object accesses the underlying dictionaries in order, stopping once it finds the key you are looking for:

```py
from collections import ChainMap

default = {
    "user": "user",
    "theme": "light",
    "lan": "en",
}

local = {
    "theme": "dark",
}

user = {
    "user": "rodrigo",
}

settings = ChainMap(user, local, default)

print(settings["user"])  # rodrigo
print(settings["theme"])  # dark
print(settings["lan"])  # en
```

The underlying dictionaries can still be modified and the changes are reflected in the chained view:

```py
user["lan"] = "pt"
print(settings["lan"])  # pt
```


Further reading:
 - [Module `collections` overview](https://mathspp.com/blog/module-collections-overview)
