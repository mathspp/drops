---
themes:
    - "lazy imports"
    - "modules"
    - "3.15 (new in Python 3.15)"
    - "performance optimisation"
---

(247)=
# 247 – Lazy imports

Lazy imports are coming to Python 3.15, with the new keyword `lazy`.
An import statement that starts with the keyword `lazy` becomes a lazy import.

Suppose you define the toy module `mod.py`:

```py
print("Hey!")

def f():
    return "Bye!"
```

The call to the function `print` at the top-level should run when the module is imported, in a regular import:

```py
import mod
# Hey!
```

If you use the keyword `lazy`, you defer the execution of the module until the module is first _used_:

```py
lazy import mod

mod.f()
# Hey!
# Bye!
```

Note how the top-level call to `print` was only executed when the module `mod` was _referenced_ the first time.
For the purposes of lazy imports, as soon as the module is _referenced_, it's executed:

```py
lazy import mod

a = mod
# Hey!
```

In the snippet above, just referencing the module `mod` to assign it to the variable `a` triggered the module's execution.

Further reading:

 - Inspect a lazy import, <https://mathspp.com/blog/til/inspect-a-lazy-import>
