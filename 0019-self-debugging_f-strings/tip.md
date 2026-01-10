---
themes:
    - "f-strings"
    - "debugging"
---

(19)=
# 19 – Self-debugging f-strings

f-strings have an awesome feature: if you include an equals sign `=` at the end of the formatted value, the f-string will show you the code and the value that you're formatting.

Here is an example:

```py
name = "RoDrIgO"
print(f"Method title: {name.title() = }")
# Method title: name.title() = 'Rodrigo'
```

Note that the spaces around the equals sign `=` are not necessary but the result usually looks better if you include them.
