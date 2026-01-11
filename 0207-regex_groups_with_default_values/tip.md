---
themes:
    - "`re`"
    - "regex"
    - "standard library"
    - "`re.Match.groups`"
---

(207)=
# 207 – Regex groups with default values

A regex match has the method `groups` that returns a tuple with all of the groups that the pattern contained:

```py
import re

pattern = r"""(?x)
    (\d+)  # 1 or more digits
    \.?    # An optional .
    (\d+)? # More optional digits
"""

m = re.match(pattern, "24.5")

print(m.groups())
# ('24', '5')
```

However, if one or more of the groups did not participate in the match, it will be replaced with the default value `None`:

```py
m = re.match(pattern, "24")

print(m.groups())
# ('24', None)
```

Alternatively, you can provide your own value for the groups that didn't participate:

```py
print(m.groups("0"))
# ('24', '0')
```
