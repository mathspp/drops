---
themes:
    - "slicing"
    - "sequences"
---

(185)=
# 185 – Slicing mnemonic

If you think about sequence indices as the matching element separators, you can use that visual cue to understand how slicing works and what elements are included in a slice:

```text
|   |   |   |   |   |   |   |
| S | L | I | C | I | N | G |
|   |   |   |   |   |   |   |
0   1   2   3   4   5   6   7
```

Using this visual cue, a slice includes all the elements between the corresponding separators:

```py
print(s[3:6])  # 'CIN'
```
