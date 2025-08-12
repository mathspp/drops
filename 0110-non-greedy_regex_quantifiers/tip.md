---
themes:
    - "regex"
    - "standard library"
    - "`re`"
---

## 110 – Non-greedy regex quantifiers

The quantifiers `*`, `+`, and `?`, in regular expressions, are all greedy.
This means that they will try to match as much as possible, while still allowing the full pattern to match:

```py
import re

html = "<a href='mathspp.com'>My site</a>"
#                            ^          ^
# Note how there are two '>' in the string.

greedy = re.compile(r"<a.*>")

print(re.match(greedy, html).group())
# <a href='mathspp.com'>My site</a>
```

However, sometimes you don’t want to match as much as possible; you want to match as little as possible.
When that’s the case, you can add a question mark `?` to the quantifiers, making them `*?`, `+?`, and `??`.
These are non-greedy and will try to match as few characters as possible:

```py
non_greedy = re.compile(r"<a.*?>")

print(re.match(non_greedy, html).group())
# <a href='mathspp.com'>
```
