---
themes:
    - "standard library"
    - "`difflib`"
    - "`difflib.get_close_matches`"
    - "text processing"
    - "3.14 (new in Python 3.14)"
---

## 152 – Find similar words

You can use the function `get_close_matches` from the module `difflib` to find words that are similar to another given word, for example in the context of an auto-correct feature.

Suppose you're trying to write a loop but misspell the keyword `while`:

```pycon
>>> whille True:
  File "<python-input-7>", line 1
    whille True:
    ^^^^^^
SyntaxError: invalid syntax. Did you mean 'while'?
```

The suggestion of the (correct) keyword `while` is done with `get_close_matches`:

```py
from difflib import get_close_matches
import keyword

print(
    get_close_matches("whille", keyword.kwlist)
)  # ['while']
```

The function `get_close_matches` also allows you to specify the maximum number of similar matches you want and the “similarity threshold” to be used.
