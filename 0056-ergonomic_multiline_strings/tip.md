---
themes:
    - "strings"
    - "multiline strings"
    - "backslash `\\`"
    - "newlines"
---

## 56 – Ergonomic multiline strings

When I'm writing multiline strings I like to have the `"""` by themselves, for readability.
However, this creates an extra empty line at the beginning and end of the string:

```py
string = """
Multiline string.
No escaped newlines
"""

print("> " + string + "!")
```
```
> 
Multiline string.
No escaped newlines
!
```

This is not what I want...
To fix this, I can use the backslash character `\` to escape those extra newlines:

```py
string = """\
Multiline string.
First & last newlines escaped\
"""

print("> " + string + "!")
```
```
> Multiline string.
First & last newlines escaped!
```
