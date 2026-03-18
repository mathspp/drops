---
themes:
    - "`dataclasses` (module)"
    - "decorators"
    - "`dataclasses.dataclass`"
    - "`itertools`"
    - "`itertools.starmap`"
    - "`csv` (module)"
    - "CSV"
    - "`csv.reader`"
---

(242)=
# 242 – Read custom objects from CSV

Say you have a CSV file with sales represented by item names, quantity sold, and price:

```text
Item 1,15,19.99
Item 2,102,9.99
Item 3,5,127
```

Suppose the data above is in a file `sales.csv` and now model each row as a dataclass:

```py
from dataclasses import dataclass

@dataclass
class Sale:
    item: str
    quantity: int
    price: float
```

With the implementation of the dataclass, you can iterate directly over sales objects by building instances of `Sale` as the data is read from the CSV file:

```py
import csv
from itertools import starmap

with open("sales.csv", "r") as f:
    reader = csv.reader(f)
    for sale in starmap(Sale, reader):
        print(sale)
# Sale(item='Item 1', quantity='15', price='19.99')
# Sale(item='Item 2', quantity='102', price='9.99')
# Sale(item='Item 3', quantity='5', price='127')
```
