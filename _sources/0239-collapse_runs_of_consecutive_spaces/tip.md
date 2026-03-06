---
themes:
    - "algorithms"
    - "strings"
    - "text processing"
    - "`functools`"
    - "`functools.partial`"
    - "`functools.Placeholder`"
    - "`str.replace`"
---

(239)=
# 239 – Collapse runs of consecutive spaces

You can collapse runs of adjacent spaces by replacing two consecutive spaces by a single one until you get to a [fixed point](238):

```py
from functools import partial, Placeholder as _P

replacer = partial(str.replace, _P, "  ", " ")
string = "This is  a   perfectly    normal     sentence."

print(fixedpoint(replacer, string))  # This is a perfectly normal sentence.
```

You need the fixed point because replacing once isn't enough:

```py
print(string.replace("  ", " "))  # This is a  perfectly  normal   sentence.
```

Further reading:

 - Remove extra spaces, <https://mathspp.com/blog/remove-extra-spaces>
