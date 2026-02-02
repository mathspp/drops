---
themes:
    - "JSON"
    - "`json` (module)"
    - "`json.dumps`"
    - "`json.dump`"
---

(218)=
# 218 – Pretty dumping JSON

The functions `dump` and `dumps` from the module `json` have parameters to write more human-readable output:

```py
import json

pets = {
  "cat": True,
  "dog": True,
  "alligator": {
    "usually": False,
    "if you're crazy": True
  }
}

print(json.dumps(pets, indent="  ", sort_keys=True))
```

By setting `indent="  "` you get two leading spaces per level of indentation and setting `sort_keys=True` the keys of dictionaries are sorted alphanumerically.

So, the code above produces the following output:

```json
{
  "alligator": {
    "if you're crazy": true,
    "usually": false
  },
  "cat": true,
  "dog": true
}
```

This is much easier to read than the default single-line output you get if you don't use the parameters `indent` and `sort_keys`:

```json
{"cat": true, "dog": true, "alligator": {"usually": false, "if you're crazy": true}}
```
