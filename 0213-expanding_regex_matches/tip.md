---
themes:
    - "regex"
    - "`re`"
    - "`re.search`"
    - "`re.Match.expand`"
    - "string formatting"
    - "text processing"
---

(213)=
# 213 – Expanding regex matches

Regex matches can be used to expand strings that reference matching groups, allowing you to quickly and conveniently format strings with data extracted from a regex.

You start by getting a regex match using any of the functions that the module `re` provides:

```py
import re

m = re.search(r"(\d+)\.(\d{2})", "Total: 12.45€")
```

The regex above extracts the number `12.45` and uses two groups to target the integer and decimal parts of the number.

Then, the method `expand` of the match can be used to format any string that references the matching groups:

```py
print(m.expand(r"The total is \1 euros and \2 cents."))
# The total is 12 euros and 45 cents.
```

The escape sequences `\1` and `\2` are actually references to the matching groups of the match `m`.
To make it easier to include the references, a raw string `r"..."` is used, otherwise the backslashes would have to be doubled.
