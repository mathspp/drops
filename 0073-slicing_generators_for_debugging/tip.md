---
themes:
    - "generators"
    - "debugging"
    - "standard library"
    - "`itertools`"
    - "`itertools.islice`"
    - "slicing"
---

## 73 – Slicing generators for debugging

When debugging with generators, you may want to use `itertools.islice`.
This allows you to easily take a look at the first few elements of the generator.

You can wrap the call to `islice` in `print(list(...))` to print the elements, or you can loop over the slice and add a breakpoint immediately before.

Here is an example using `print(list(islice(..., n)))` to print the first `n` elements immediately:

```py
from itertools import islice

gen = mysterious_generator()

print(list(islice(gen, 3)))  # [0, 1, 4]
```

Remember that if you use `islice` again, you'll be slicing from the _remainder_ of the generator:

```py
print(list(islice(gen, 3)))
# [9, 16, 25]
print(list(islice(gen, 3)))
# [36, 49, 64]
```
