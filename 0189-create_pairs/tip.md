---
themes:
    - "iterables"
    - "`itertools`"
    - "`itertools.product`"
    - "`itertools.combinations`"
---

(189)=
# 189 – Create pairs

To create pairs with elements from an iterable, you can use `itertools.product` for all ordered pairs:

```py
from itertools import product

names = ["Harry", "Hermione", "Ron"]

for a, b in product(names, repeat=2):
    print(a, b)
```
```text
Harry Harry
Harry Hermione
Harry Ron
Hermione Harry
Hermione Hermione
Hermione Ron
Ron Harry
Ron Hermione
Ron Ron
```

The pairs created included repeated elements, which you might want to filter by hand.
Alternatively, you can use `itertools.combinations` for all unique pairs:

```py
from itertools import combinations

for a, b in combinations(names, 2):
    print(a, b)
```
```text
Harry Hermione
Harry Ron
Hermione Ron
```

Further reading:

- [Module `itertools` overview](https://mathspp.com/blog/module-itertools-overview)
