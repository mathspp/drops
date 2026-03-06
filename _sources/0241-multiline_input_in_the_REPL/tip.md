---
themes:
    - "REPL"
    - "I/O"
    - "multiline strings"
    - "built-ins"
    - "`open` (built-in)"
---

(241)=
# 241 – Multiline input in the REPL

Use `open(0)` to read multiline input directly in the REPL:

```pycon
>>> msg = open(0).read()
Hello,
world!
^D
>>> print(msg)
Hello,
world!
```

The `^D` on a new line is the keyboard shortcut `Ctrl`+`D` and it sends an EOF signal on Unix systems.
If you're on Windows, use `Ctrl`+`Z` instead.
That's how you signal that you're done providing input.

If you're going to need to provide repeated multiline input, then you'll want to use `open(0, closefd=False)` instead.
If you don't set `closefd=False`, when you're done with the input the file descriptor `0` will be closed for good and you'll get an exception if you try to open it again.

Further reading:

 - Multiline input in the REPL, <https://mathspp.com/blog/til/multiline-input-in-the-repl>
