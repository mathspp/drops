---
themes:
    - "I/O"
    - "pretty printing"
    - "`pprint`"
    - "standard library"
    - "`pprint.pprint`"
---

## 101 – Pretty-printing nested data structures

The module `pprint` from the standard library provides pretty-printing functionality.
The most straightforward way of using it is through the function `pprint.pprint`, which pretty-prints its arguments.
It is particularly useful when printing nested data structures:

```pycon
>>> import pprint
>>> pprint.pprint(globals())
{'__builtins__': <module 'builtins' (built-in)>,
 '__doc__': None,
 '__loader__': <_frozen_importlib_external.SourceFileLoader object at 0x10324d910>,
 '__name__': '__main__',
 '__package__': None,
 '__spec__': None,
 'partial': <class 'functools.partial'>,
 'pprint': <function pprint at 0x10362c1a0>}
```
