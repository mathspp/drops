---
themes:
    - "`sys` (module)"
    - "`sys.exit`"
    - "terminal"
---

(216)=
# 216 – Setting the exit code

For scripts, command line interfaces, and other code that is typically run in the terminal, use `sys.exit` to set the exit code to an appropriate value.

An exit code of `0` means the program terminated successfully:

```py
import sys

# ...

sys.exit(0)
```

Any other integer value (from `1` to `255`) will tell the terminal that the program ended with an error:

```py
import sys

# ...

sys.exit(42)  # Error code 42.
```

It is up to your program to assign meaning to each error code, in case it's relevant.

A program that terminates with an exception automatically gets the error code `1`:

```py
# myscript.py

1 / 0
```

The file `myscript.py` has the single line `1 / 0`, which raises an exception.
Running it in the terminal, you see the exception:

```bash
$ python myscript.py
ZeroDivisionError: division by zero
$ echo $?
1
```

The command `echo $?` prints the exit code of the previous command, so the result of `1` shows that Python terminated with the exit code `1`.
