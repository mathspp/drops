---
themes:
    - "iterables"
    - "`itertools`"
    - "`itertools.count`"
---

(195)=
# 195 – ID generator

Use `itertools.count` to generate unique sequential IDs:

```py
from itertools import count

class Tab:
    _id_generator = count()
    
    def __init__(self):
        self.tab_id = next(self._id_generator)
```

By keeping a reference to `_id_generator` and reusing it inside `Tab.__init__`, every time you create a tab you get a new ID:

```py
tab1 = Tab()
tab2 = Tab()
tab3 = Tab()

print(tab1.tab_id)  # 0
print(tab2.tab_id)  # 1
print(tab3.tab_id)  # 2
```
