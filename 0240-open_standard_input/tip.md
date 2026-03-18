---
themes:
    - "file I/O"
    - "built-ins"
    - "`open` (built-in)"
---

(240)=
# 240 – Open standard input

The built-in function `open` can accept integer file descriptors, which means you can read from `stdin` by using `open(0)`!
Suppose you have a short text file called `fox.txt`:

```text
The quick brown fox
jumps over the lazy dog.
```

And you also have a short Python script, called `reader.py`, that prints the first line from stdin:

```py
with open(0) as f:
    print(f.readline())
```

Now, if you run the script `reader.py` and pipe in the contents of `fox.txt`, you get the first line of the text file:

```bash
$ python reader.py < fox.txt
```
```text
The quick brown fox
```

Further reading:

 - `open(0)`, <https://mathspp.com/blog/til/020>
