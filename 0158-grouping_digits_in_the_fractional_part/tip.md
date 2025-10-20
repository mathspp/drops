---
themes:
    - "3.14 (new in Python 3.14)"
    - "strings"
    - "string formatting specification language"
    - "string formatting"
    - "f-strings"
    - "readability"
    - "underscore `_`"
    - "comma (`,`)"
---

## 158 – Grouping digits in the fractional part

You can [group digits in integers with underscores or commas](#formatting-big-numbers), but since Python 3.14 that you can also do the same to the digits of the fractional part of a number.

```py
x = 12345.09876543

f"{x:.,}"  # '12345.098,765,43'
f"{x:._}"  # '12345.098_765_43'
```

The grouping can be specified independently for the digits before and after the decimal point by including a grouping character before or after the dot in the formatting specification:

```py
f"{x:_.,}"  # '12_345.098,765,43'
```

Remember that if you only specify the grouping character, it will only group the digits of the integral part (see [“Formatting big numbers”](#formatting-big-numbers)):

```py
f"{x:_}"  # '12_345.09876543'
```
