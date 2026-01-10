---
themes:
    - "debugging"
    - "standard library"
    - "3.14 (new in Python 3.14)"
---

(163)=
# 163 – Remote interactive debugging

Since Python 3.14 that the module `pdb` has a CLI option that allows you to attach to a running Python process to debug interactively while it's running.

Suppose you have some buggy and complex business logic:

```py
acc = 0

while True:
    acc += 1
```

You save this code in the file `myscript.py` and run it.
The program never finishes, so you see it's running in the process with ID 12345 and you use the module `pdb` to attach to it:

```bash
$ python -m pbd -p 12345
```

Once you do, the debugger attaches to your program _while_ it's running.
Here, you can see you attached to the program as it was about to run the line `acc += 1`.
Before you do, you may want to **_p_**rint the value of the variable `acc`:

```text
> /path/to/script.py(4)<module>()
-> acc += 1
(Pdb) p acc
559642795
```

Now, you may want to go to the next line of the function and print the value of the variable `acc` again:

```text
(Pdb) next
> /path/to/script.py(3)<module>()
-> while True:
(Pdb) p acc
559642796
```
