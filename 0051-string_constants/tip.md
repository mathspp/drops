---
themes:
    - "strings"
    - "`string` (module)"
    - "standard library"
    - "`string.ascii_lowercase`"
    - "`string.digits`"
    - "`string.punctuation`"
---

## 51 – String constants

The module `string` defines many useful constants that you can, and should, use!
These will save you the time of defining the constants yourself and prevent plenty of easily-avoidable bugs.

Here are three examples:

```py
import string

print(string.ascii_lowercase)
# abcdefghijklmnopqrstuvwxyz

print(string.digits)
# 0123456789

print(string.punctuation)
# !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
```

If you find that this tip is silly, consider the fact that I found over 10,000 repositories on GitHub with bugs because they had typos when defining constants with the full latin alphabet.
These bugs could have been avoided by using `string.ascii_lowercase`...

Further reading:

 - [Finding and fixing over 10,000 bugs on GitHub](https://mathspp.com/blog/finding-and-fixing-over-10000-bugs-on-github) blog article.
