---
themes:
    - "regex"
    - "standard library"
    - "`re`"
    - "`re.match`"
    - "`re.group`"
    - "named groups"
---

## 63 – Named groups in regex

If you're using regex (I'm sorry!) and you want to extract portions of patterns with groups, you can use named groups to make extraction easier.

To create a named group, start the group with `?P<...>` and put the group name inside the angled brackets `<>`, as the example below shows:

```py
import re

pattern = r"(?P<user>\S+)@(?P<domain>\S+)"
```

Then, when you get a match, you can use the method `group` to extract groups by name:

```py
match = re.match(pattern, "rodrigo@mathspp.com")

print(match.group("user"))  # rodrigo
print(match.group("domain"))  # mathspp.com
```

Note that this is a Python-specific feature and that are unlikely to have this feature when working with regex in other contexts/programming languages.
