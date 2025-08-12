---
themes:
    - "dunder methods"
    - "`__getattr__`"
    - "dynamic code"
    - "modules"
    - "`globals`"
    - "namespaces"
---

## 108 – Dynamic module attribute look-up

Modules can implement the dunder method `__getattr__`, which can be used to dynamically load names into a module.
This can be useful to create lazy imports or to issue warnings when certain things are imported.

Suppose `HeavyClass` is available from the module `my_module`, but suppose that `HeavyClass` takes a while to initialise/import and therefore you want to be able to import it lazily.
Then, you'd define this `__getattr__` in `my_module`:

```py
def __getattr__(name):
    if name == "HeavyClass":
        print("Lazy importing...")
        from _module import HeavyClass
        globals()[name] = HeavyClass
        return HeavyClass
        
    raise AttributeError(f"module {__name__!r} has no attribute {name!r}")
```

Then, you can use `HeavyClass` elsewhere.
The first time you use it, you'll trigger `__getattr__`, but the second time you won't because the lazy import is then saved in the global namespace of the module.

```py
import my_module

obj1 = my_module.HeavyClass()
# Lazy importing...

obj2 = my_module.HeavyClass()
```

This is used in the modules `typing` and `collections`, for example!
