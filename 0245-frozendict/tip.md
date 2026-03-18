---
themes:
    - "3.15 (new in Python 3.15)"
    - "`frozendict`"
    - "immutability"
---

(245)=
# 245 – `frozendict`

Python 3.15 comes with the new built-in type `frozendict`, an immutable dictionary type.

Trying to modify an existing key/value pair or adding a new key raises a `TypeError`:

```pycon
>>> fd = frozendict({"one": 2})
>>> fd["one"] = 1
TypeError
>>> fd["two"] = 2
TypeError
```

It's also worth noting that the immutability of a frozen dictionary is shallow.
You can still mutate the underlying values:

```pycon
>>> fd = frozendict({"list": []})
>>> fd
frozendict({'list': []})
>>> fd["list"].append(73)
>>> fd
frozendict({'list': [73]})
```

Remember that this behaviour matches the behaviour of a tuple.
