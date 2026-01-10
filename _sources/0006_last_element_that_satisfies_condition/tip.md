---
themes:
    - "iterables"
    - "`collections.deque`"
    - "generation expression"
---

(6)=
# 6 – Last element that satisfies a condition

If you have a condition, you can get the last element of an iterable that satisfies that condition with `collections.deque` and a generator expression:

```py
from collections import deque

last = deque(
    (elem for elem in iterable if condition(elem)),
    maxlen=1,
).pop()
```

If there are no such elements, the `deque` will be empty and popping gives an `IndexError`, so you may need to account for that.
You can either

 1. check if the `deque` has any elements before popping:
 
```py
from collections import deque

important_numbers = [42, 10, 16, 0]
dq = deque((num for num in important_numbers if num % 2), maxlen=1)
if not dq:
    print("No odd numbers found!")
# No odd numbers found!
```
 
 2. or you can handle the `IndexError` that you might get when popping:

```py
from collections import deque

important_numbers = [42, 10, 16, 0]
try:
    last_odd = deque(
        (num for num in important_numbers if num % 2),
        maxlen=1,
    ).pop()
except IndexError:
    print("No odd numbers found!")
# No odd numbers found!
```

Further reading:

 - [Overview of the module `collections`](https://mathspp.com/blog/module-collections-overview)
 - [`deque` tutorial](https://mathspp.com/blog/python-deque-tutorial)
