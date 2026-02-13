---
themes:
    - "`sys` (module)"
    - "`sys.stderr`"
    - "`print`"
    - "unexpected argument"
---

(219)=
# 219 – Print to standard error

You can print directly to _standard error_ (`sys.stderr`) by using the parameter `file` that the built-in function `print` supports:

```py
import sys

print("Hello, world!")
print("Bye!", file=sys.stderr)
```

The argument passed to `file` can be any file-like object and it defaults to `sys.stdout`.
By running the code above, _stdout_ will show the following output:

```text
Hello, world!"
```

And _stderr_ will show the following output:

```text
Bye!
```

If you run the code in a regular terminal, you'll see both prints.
To see the distinction, you can try redirecting _stdout_ to a file to only see the message “Bye!”:

```bash
$ python streams.py > random_file.txt
Bye!
$ cat random_file.txt
Hello, world!
```
