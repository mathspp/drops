---
themes:
    - "debugging"
    - "`pdb`"
    - "`breakpoint`"
---

(196)=
# 196 – Drop into a debugger

The built-in function `breakpoint` stops your program and drops you into a debugger at the call site.
For example, suppose you write this program, that defines two variables and calls `breakpoint` _before_ the final call to `print`:

```py
x = 73
y = 42

breakpoint()

print("Program finished")
```

By running this program, you'll be dropped into a debugger between the variable assignments and the call to `print`.
By default, `breakpoint` opens pdb:

```text
-> breakpoint()
(Pdb) p x
73
(Pdb) p y
42
(Pdb) c
Program finished
```

When you're done debugging, you can type `c` (short for **c**ontinue) to exit the debugger and run the remainder of the program.
