---
themes:
    - "standard library"
    - "`itertools`"
    - "`itertools.cycle`"
    - "modulo operator"
---

## 146 – Cycling over an iterable

Whenever you need to cycle over an iterable use `itertools.cycle`:

```py
from itertools import cycle

servers = [...]

for server in cycle(servers):
    server.ping()
```

This is preferred over the modulo operator trick:

```py
servers = [...]
idx = 0

while True:
    idx = (idx + 1) % len(servers)
    servers[idx].ping()
```

The two main advantages are that

 1. `cycle` is more readable because the name spells out what you are doing; and
 2. the modulo operator trick has limitations, since it only works on iterables that you can index and compute the length of.
