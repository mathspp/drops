---
themes:
    - "standard library"
    - "built-ins"
    - "`iter`"
    - "`functools`"
    - "`functools.partial`"
    - "iterables"
    - "file I/O"
    - "unexpected argument"
---

## 43 – Read files in chunks

The built-in `iter` can be used to turn functions into iterables.
In its not-so-well-known form, `iter(f, sentinel)` creates an iterable that calls the function `f` until the function returns the value `sentinel`.

For example, paired with `functools.partial`, you can use it to create a “chunk” reader that reads files in chunks:

```py
from functools import partial

with open("bee-movie-script.txt", "r") as f:
    chunk_reader = iter(partial(f.read, 16), "")
    for chunk in chunk_reader:
        print(chunk)

"""
According to all
 known laws of a
viation, there i
s no way a bee s
hould be able to
...
"""
```

Further reading:

 - [Making an iterator out of a function](https://mathspp.com/blog/til/making-an-iterator-out-of-a-function)
