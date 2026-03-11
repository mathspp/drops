---
themes:
    - "text processing"
    - "strings"
    - "`re`"
    - "`re.split`"
    - "regex"
    - "`str.split`"
---

(243)=
# 243 – Split text into words

When you need to split text into words, the typical solution of using the string method `split` will produce words with adjacent punctuation:

```py
text = "Hello, there!"
print(text.split())
# ['Hello,', 'there!']
```

A more robust approach uses the regular expression function `re.split` and the special regex character `\W`:

```py
import re

print(re.split(r"\W+", text))
# ['Hello', 'there', '']
```

The character `\W` matches non-word characters, so your final list will only contain words strings: strings of alphanumeric characters.
You can tweak the regular expression to match your expectation of what a _word_ must be.

The final empty string `''` shows up because the original text ends with a separator.
