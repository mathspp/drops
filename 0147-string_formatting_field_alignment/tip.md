---
themes:
    - "strings"
    - "f-strings"
    - "string formatting specification language"
    - "string formatting"
---

## 147 – String formatting field alignment

There are three main alignment options in string formatting:

| Character | Meaning |
| | |
| `<` | align left |
| `>` | align right |
| `^` | centre |

```py
total = 123

print(f"Total: ${total:<7}.")
# Total: $123    .

print(f"Total: ${total:>7}.")
# Total: $    123.

print(f"Total: ${total:^7}.")
# Total: $  123  .
```

For most objects, the default is to align left:

```py
obj = "hi"
print(f"-{obj:10}-")
# -hi        -
```

However, for numbers, the default is to align right:

```py
obj = 42
print(f"-{obj:10}-")
# -        42-
```

(There is also a fourth alignment option `=` that only works with numbers!)
