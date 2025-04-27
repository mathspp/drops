---
themes:
    - strings
    - "`str.translate`"
    - "`str.replace`"
    - punctuation
    - "`string (module)`"
---

## 10 – Remove punctuation from a string

Don't use the method `replace` to remove punctuation from a string.
Instead, use the method `translate`.

The method `translate` is an efficient and general-purpose method for replacing (or removing) multiple characters in a string simultaneously.

The method `translate` expects a “translation table” argument in a very specific format, but the string class method `maketrans` can build that for us:

```py
import string

# print(string.punctuation)  # !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
punctuation_removal = str.maketrans("", "", string.punctuation)

s = "Hello, world!"
print(s.translate(punctuation_removal))
# Hello world
```

Further reading:
 - [String `translate` and `maketrans` methods](https://mathspp.com/blog/pydonts/string-translate-and-maketrans-methods)
