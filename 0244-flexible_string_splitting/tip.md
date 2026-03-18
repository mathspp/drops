---
themes:
    - "text processing"
    - "strings"
    - "`re`"
    - "`re.split`"
    - "regex"
---

(244)=
# 244 – Flexible string splitting

The function `re.split` lets you split a string on occurrences of a pattern, as you saw [in the previous tip](243).

Groups that are parenthesised in the splitting pattern are included in the resulting list:

```py
import re

text = "Hey there, buddy!"
print(re.split(r"\W+", text))
# ['Hey', 'there', 'buddy', '']
print(re.split(r"(\W+)", text))
# ['Hey', ' ', 'there', ', ', 'buddy', '!', '']
```

Just like with the string method `split`, you can specify a maximum number of splits with the parameter `maxsplit`:

```py
print(re.split(r"\W+", text, maxsplit=1))
# ['Hey', 'there, buddy!']
```
