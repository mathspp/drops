---
themes:
    - "strings"
    - "t-strings"
    - "3.14 (new in Python 3.14)"
    - "string formatting"
---

## 156 – Custom t-string processing

t-strings, introduced in Python 3.14, offer a flexible and safe way of doing string formatting in contexts where care must be taken with the interpolated values.

For example, you can think about SQL injection attacks or having to escape some characters when interpolating strings that contain HTML.

When you create a t-string you must process it in order to create the final string object.
For example, the variable `s` doesn't hold a string yet:

```py
greeting = "Hey, there"
num = 3

s = t"He said {greeting} and waved {num} times."
#     ^^^^^^^^          ^^^^^^^^^^^     ^^^^^^^  # String literal parts.
#             ^^^^^^^^^^           ^^^^^         # Interpolated parts.
```

To process `s` into a string you can specify a function that iterates over the parts of the t-string and does whatever you need to each part.
Parts that are interpolated values have an attribute `value` that is the original object being interpolated:

```py
def auto_repr(tstring):
    parts = [
        part if isinstance(part, str) else repr(part.value)
        for part in tstring
    ]
    return "".join(parts)

print(auto_repr(s))
# "He said 'Hey, there' and waved 3 times."
#          ^^^^^^^^^^^^           ^          # Interpolated parts.
```
