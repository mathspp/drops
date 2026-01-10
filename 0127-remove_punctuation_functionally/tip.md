---
themes:
    - "strings"
    - "`str.translate`"
    - "`str.replace`"
    - "punctuation"
    - "`string` (module)"
    - "functional programming"
    - "standard library"
    - "`functools`"
    - "`functools.partial`"
    - "`functools.Placeholder`"
    - "3.14 (new in Python 3.14)"
---

(127)=
# 127 – Remove punctuation functionally

You [already know how to remove punctuation from a string](10), but you can leverage `functools.Placeholder` (new in Python 3.14) and `functools.partial` to turn that into a function:

```py
from functools import Placeholder as _P, partial
import string

remove_punctuation = partial(
    str.translate,
    _P,
    str.maketrans("", "", string.punctuation),
)
```

Now, you can pass a string into the function `remove_punctuation`, which puts it as the first argument to `str.translate` because of the usage of `Placeholder`:

```py
print(remove_punctuation("Hello, world!"))
# Hello world
```

This wouldn't have been possible without `Placeholder` because `str.translate` only accepts positional-only arguments.

Further reading:

 - [`functools.Placeholder`](https://mathspp.com/blog/how-to-use-functools-placeholder)
 - [`functools.partial`](https://mathspp.com/blog/functools-partial)
 - [String `translate` and `maketrans` methods](https://mathspp.com/blog/pydonts/string-translate-and-maketrans-methods)
