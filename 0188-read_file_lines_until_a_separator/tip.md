---
themes:
    - "file I/O"
    - "text processing"
    - "`iter`"
---

(188)=
# 188 – Read file lines until a separator

To read the lines of a file until you hit a predetermined separator, you can use the special form of the built-in function `iter`, the method `readline`, and the string literal that matches the separator.

For example, suppose you have this file called `names.txt`:

```text
Harry
Hermione
Ron
---
Potter
Granger
Weasley
```

If you want to read lines until you hit the separator `"---"`, you can use the building blocks mentioned:

```py
first_names = []
with open("names.txt", "r") as f:
    for name in iter(f.readline, "---\n"):
        first_names.append(name.strip())

print(first_names[-1])  # Ron
```

The expression `iter(f.readline, "---\n")` creates an iterable that calls `f.readline` — to read a line from the file — repeatedly until `f.readline()` returns `"---\n"`, the line with the separator.
Note how the separator ends with the newline character `"\n"`, since the method `f.readline` returns lines with the newline characters.
