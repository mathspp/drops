---
themes:
    - "regex"
    - "`re`"
    - "regex flags"
    - "multiline strings"
---

(69)=
# 69 – Regex multiline flag

Regular expressions have a multiline flag that can be used to change the behaviour of the special characters `^` and `$`.
By default, `^` and `$` match the beginning and end of the string, respectively; with the multiline flag, they match the beginning and end of each line, respectively.

The flag can be used inline with `(?m)`, or passed in to the relevant functions of the module `re` with `re.MULTILINE`.

As an example, take the following string that spans across two lines:

```text
The quick brown fox jumps over
the lazy dog.
```

The pattern `r"^[Tt]he"` will only match the first “The”, while the pattern `r"(?m)^[Tt]he"` will match the two occurrences of the word “the”.
