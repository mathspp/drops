---
themes:
    - "`re`"
    - "`re.sub`"
    - "regex"
    - "standard library"
    - "strings"
---

(50)=
# 50 – Dynamic regex replacements

The module `re` allows you to do dynamic string replacements.
That is, search and replace for certain patterns and then replace them with _other_ things that are not constant.

For this, you need a function that accepts a regex match and returns a replacement.

For example, the function `replace` below (admittedly, a poorly-named function), accepts a match and returns a string of asterisks that is as long as the full match:

```py
def replace(match):
    return "*" * len(match.group(0))
```

Then, when using `re.sub`, pass it the function that does the replacements instead of specifying a fixed string:

```py
import re

text = "I know Python, C, C++, JavaScript, and Haskell."

bad_words = r"C(\+\+)?|JavaScript"

print(re.sub(bad_words, replace, text))
# I know Python, *, ***, **********, and Haskell.
```

Further reading:

 - [Dynamic string replacements with regex blog article](https://mathspp.com/blog/dynamic-string-replacements-with-regex)
