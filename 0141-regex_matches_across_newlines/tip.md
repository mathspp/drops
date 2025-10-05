---
themes:
    - "regex flags"
    - "standard library"
    - "strings"
    - "`re`"
    - "regex"
---

## 141 – Regex matches across newlines

The special character `.` (dot) matches anything in the context of a regular expression, except for the newline character:

```py
import re

pattern = r"<!--.*-->"  # HTML multiline comment.
text = """# Python drops <!--This
is a multiline comment.-->"""
```

```py
print(re.search(pattern, text))  # None
```

If you want to use the special character `.` (dot) for matches that potentially span across multiple lines, you'll need to use flag `re.DOTALL`:

```py
print(re.search(pattern, text, flags=re.DOTALL))
# <re.Match object; ...
```
