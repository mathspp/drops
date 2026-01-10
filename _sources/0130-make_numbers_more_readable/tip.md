---
themes:
    - "readability"
    - "underscore `_`"
    - "number bases"
---

(130)=
# 130 – Make numbers more readable

You can use the character underscore `_` in number literals (integers, floats, and complex numbers), to separate groups of digits.
This works for [any base that Python supports](126):

 - grouping digits by thousands in base 10;
 - grouping bits by 4 or 8 bits in base 2; and
 - grouping RGB channels in colours represented in hexadecimal,

are just some examples:

```py
x = 12_345_678  # integer
almost_x = 12_345_677.99  # float
complex_x = 1+23_456j  # complex

binary = 0b1110_0100
octal = 0o7351_2242
hexadecimal = 0xff_d3_ab
```
