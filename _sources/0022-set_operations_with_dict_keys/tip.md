---
themes:
    - "sets"
    - "dictionaries"
    - "`dict.keys`"
---

(22)=
# 22 – Set operations with `dict.keys()`

Dictionaries have a method `keys` that returns a view over the keys of the dictionary.
These objects support set operations, which means you can manipulate dictionary keys very efficiently and conveniently.

For example, for two dictionaries `dict1` and `dict2`, you can easily compute:

 1. the keys available simultaneously in both dictionaries with `dict1.keys() & dict2.keys()`;
 2. the keys available in `dict1` but not in `dict2` with `dict1.keys() - dict2.keys()`; and
 3. the keys available in either dictionary with `dict1.keys() | dict2.keys()`.

Here are the corresponding examples:

```py
en_pt = {  # dict1
    "yellow": "amarelo",
    "red": "vermelho",
}

en_fr = {  # dict2
    "red": "rouge",
    "blue": "bleu",
}
```

```py
# Keys in both:
print(en_pt.keys() & en_fr.keys())
# {'red'}

# Keys in en_pt but not in en_fr:
print(en_pt.keys() - en_fr.keys())
# {'yellow'}

# Keys in either:
print(en_pt.keys() | en_fr.keys())
# {'red', 'yellow', 'blue'}
```
