---
themes:
    - "strings"
    - "`repr`"
    - "debugging"
    - "`print`"
    - "I/O"
    - "f-strings"
---

## 44 – Format specifier `!r`

When you're using f-strings, you can use the format specifier `!r` to use a value's debugging representation instead of pretty-printing it.

Some values and types cannot be distinguished from one another if you pretty-print them, but can if you use their debugging representation.
For example, if a string represents an integer, you can't distinguish it from the same integer when printing:

```py
s = "3"
print(f"{s}")  # 3
# !? Was `s` the string "3" or the integer 3?
```

Using `!r` makes it clearer what's being printed:

```py
print(f"{s!r}")  # '3'
```

Here's another example:

```py
from fractions import Fraction

one_third = Fraction(1, 3)
print(f"{one_third}, {one_third!r}")
# 1/3, Fraction(1, 3)
```

Further reading:

 - [`str` and `repr`](https://mathspp.com/blog/pydonts/str-and-repr)
