---
themes:
    - "sets"
    - "dictionaries"
    - "`dict.keys`"
---

(190)=
# 190 – Use set operations with dictionary keys

Dictionary keys also support set operations like union, intersection, and difference:

```py
invited = {"Anne", "Ben", "Charles"}

arrivals = {
    "Anne": "7:59",
    "Ben": "8:03",
    "Dani": "8:15",
}

absent = invited - arrivals.keys()
print(absent)  # {'Charles'}

party_crashers = arrivals.keys() - invited
print(party_crashers)  # {'Dani'}
```

The snippet above shows that using a set operation with a dictionary keys object and a set is still a set.
