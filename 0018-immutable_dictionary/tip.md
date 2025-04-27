---
themes:
    - standard library
    - types (module)
    - "`types.MappingProxyType`"
    - dictionaries
    - immutability
---

## 18 – Immutable dictionary

The module `types` exposes `MappingProxyType`, a type that's essentially an immutable dictionary.

So, if you want an immutable dictionary, create a regular one and wrap it in `MappingProxyType`:

```py
from types import MappingProxyType

my_dict = MappingProxyType(
    {
        "url": "mathspp.com",
        "email": "rodrigo@mathspp.com",
    }
)

print(my_dict["url"])  # mathspp.com

# TypeErrors:
my_dict["name"] = "Rodrigo"
my_dict["url"] = ""
```

Be careful not to keep references to the underlying dictionary, though...
If you do, and if you modify the underlying dictionary, the changes are reflected in the immutable dictionary:

```py
from types import MappingProxyType

base_dict = {
    "url": "mathspp.com",
    "email": "rodrigo@mathspp.com",
}
immutable = MappingProxyType(base_dict)

print(immutable["url"])  # mathspp.com

base_dict["url"] = "example.com"
print(immutable["url"])  # example.com
```

Further reading:
 - [How to make an Immutable Dict in Python](https://adamj.eu/tech/2022/01/05/how-to-make-immutable-dict-in-python/)
