---
themes:
    - "file I/O"
    - "standard library"
    - "`collections` (module)"
    - "`collections.deque`"
    - "iterables"
---

## 60 – File tail

You can get the last few lines of a file with `collections.deque`.
You just have to set `maxlen` to the number of lines you want from the end of the file:

```py
from collections import deque

with open("/path/to/python/lib/this.py", "r") as f:
    tail = deque(f, maxlen=4)

for line in tail:
    print(line)

#     for i in range(26):
#         d[chr(i+c)] = chr((i+13) % 26 + c)
# 
# print("".join([d.get(c, c) for c in s]))
```

If the file has fewer lines than the ones you asked for, you get the full file.

Further reading:

 - [`deque` tutorial](https://mathspp.com/blog/python-deque-tutorial).
