---
themes:
    - "`sys` (module)"
    - "`sys.argv`"
---

(222)=
# 222 – Command line arguments

The list `sys.argv` contains all the arguments your program was called with, including the program name.
Suppose the file `myscript` simply prints the list:

```py
import sys

print(sys.argv)
```

Here is an example invocation:

```bash
$ python myscript.py test --flag=2
['myscript.py', 'test', '--flag=2']
```

Note how there is no parsing involved.
The elements of the list are the whitespace-separated arguments written in front of the program name.
