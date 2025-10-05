---
themes:
    - "strings"
    - "standard library"
    - "`itertools`"
    - "`itertools.groupby`"
    - "`key` (keyword argument)"
    - "`str.isalpha`"
---

## 131 – Efficiently count words in a string

You can efficiently count how many words a string has by using `itertools.groupby`:

```py
from itertools import groupby

def count_words(s):
    return sum(is_alpha for is_alpha, _ in groupby(s, key=str.isalpha))
```

This is so efficient, you could use it to count words on files larger than your computer's RAM memory.
But here's an example usage with a smaller string:

```py
print(
    count_words("Hey there–how you doin'?")
)  # 5
```

Note that, depending on the predicate you use as the keyword argument `key`, you get different definitions of “word”.
By using `is_alpha`, you are implicitly defining a “word” to be a sequence of characters for which the string method `str.isalpha` returns `True`.

Under the hood, `groupby` is grouping characters in runs of characters for which `str.isalpha` is `True` and runs for which it is `False`, and then you're counting the number of runs associated with the value `True`.
