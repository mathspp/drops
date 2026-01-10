---
themes:
    - "integers"
    - "number bases"
    - "readability"
---

(126)=
# 126 – Integer literals in multiple bases

Python integer literals are base 10 by default.
But you can also use the prefixes `0b`, `0o`, and `0x`, to write integer literals in binary, octal, and hexadecimal, respectively:

| Prefix | Base |
| - | - |
| `0b` | binary |
| `0o` | octal |
| `0x`| hexadecimal |

```py
feature_flags = 0b1101  # turn off *that* feature

file_permissions = 0o755  # default file permissions

magenta = 0xCE5D97  # accent colour used on my site
```

Further reading:

 - [Base conversion in Python](https://mathspp.com/blog/base-conversion-in-python)
