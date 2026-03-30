---
themes:
    - "built-ins"
    - "Unicode"
    - "`ord`"
    - "`chr`"
    - "strings"
---

(255)=
# 255 – Unicode codepoints

Use the built-in function `ord` convert one-character strings into their Unicode codepoints:

```py
print(ord("a"))  # 97
print(ord("A"))  # 65
```

Use the built-in function `chr` to convert a Unicode codepoint into the corresponding character:

```py
print(chr(97))  # "a"
print(chr(65))  # "A"
```

These conversions work for all valid Unicode codepoints, including emojis.
