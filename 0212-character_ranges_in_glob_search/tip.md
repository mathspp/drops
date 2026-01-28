---
themes:
    - "`pathlib`"
    - "filesystem"
    - "`pathlib.Path.glob`"
---

(212)=
# 212 – Patterns in `glob` search

The method `glob` of `pathlib.Path` can look for file names that match patterns using character ranges.
The syntax for a character range is the same as in regular expressions, and it's the square brackets `[...]` with two characters separated by a hyphen.
For example, the character range `[0-9]` matches any of the ten digits in the string `"0123456789"`.

Suppose your current working directory has these files:

```text
- 01_ideas.txt
- 02_todo.txt
- 03_cover.png
- draft.txt
```

The first three files have a numeric prefix but only two of them are text files (`.txt`).
If you wanted to find all text files with a numeric prefix, you could use two character ranges to do that:

```py
import pathlib

for txt_file in pathlib.Path().glob("[0-9][0-9]*.txt"):
    print(txt_file.name)
# 01_ideas.txt
# 02_todo.txt
```

The character ranges `[0-9][0-9]` match the initial numeric prefix and the asterisk `*` matches an arbitrary file name.
The final `.txt` matches the literal characters `".txt"`.

Note that the patterns that `glob` supports may _look like those of regular expressions_, but they are not the same thing.
`glob` supports a much more limited set of patterns.
