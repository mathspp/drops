---
themes:
    - "dynamic code"
    - "strings"
    - "string formatting"
---

(94)=
# 94 – Dynamic width string formatting

String formatting accepts formatting specifiers dynamically if you specify them within an extra set of curly braces `{}`.
This is useful, for example, to compute the maximum width of a column from a list of strings to format them neatly:

```py
fruits = ["banana", "cantalope", "pear"]
max_width = max(map(len, fruits))
# max_width is 9

for idx, fruit in enumerate(fruits, start=1):
    print(f"{fruit:<{max_width}} - {idx}")
#                   ^^^^^^^^^^^
```
```
banana    - 1
cantalope - 2
pear      - 3
```

Note how all fruits are left aligned on a field that is as wide as the word “cantalope”, since the variable `max_width` has the value `9`.
To tell the string formatting that the width is supposed to be the value of the variable `max_width`, you specify the width as `{max_width}` _inside_ the format.
