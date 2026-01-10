---
themes:
    - "standard library"
    - "`collections` (module)"
    - "`collections.Counter`"
    - "`itertools`"
    - "`itertools.chain`"
---

(11)=
# 11 – Count characters in a file

You can use `chain` from the module `itertools` to iterate over the characters of a file, with `chain.from_iterable(f)`.

Pair it with `Counter`, from the module `collections`, and you have a way to count all characters in a file with `Counter(chain.from_iterable(f))`:

```py
from collections import Counter
from itertools import chain

with open("/Users/rodrigogs/.zshrc") as f:
    chars = Counter(chain.from_iterable(f))

print(chars.most_common(5))
# [(' ', 583), ('e', 314), ('t', 273), ('o', 264), ('n', 216)]
```

Now…
It’s unlikely that you’ll have to count the characters in a file very often.
But this fun example helps you understand what `chain` can do, and `chain` is quite useful!

(**Note**: by default, line endings of the form `\r\n` will get turned into `\n`, so `\r` won't be counted. This may or may not be desirable.)

Further reading:

 - [Overview of the module `collections`](https://mathspp.com/blog/module-collections-overview)
 - [Overview of the module `itertools`](https://mathspp.com/blog/module-itertools-overview)
