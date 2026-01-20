---
themes:
    - "JSON"
    - "`json` (module)"
    - "`json.dump`"
    - "`json.dumps`"
    - "data processing"
---

(210)=
# 210 – Convert data to a JSON string

The function `dumps` from the module `json` can be used to convert data into a JSON string:

```py
import json

data = {"key1": True, "key2": [73, 42, 10]}

dumped = json.dumps(data)
print(type(dumped), dumped)
# <class 'str'> {"key1": true, "key2": [73, 42, 10]}
```

The value `dumped` that is printed looks almost the same as the variable `data`, but you can see that the Boolean value `True` was converted to `true`, since `True` is not a valid JSON value.

This is useful if you need to pass JSON data to other functions or processes but if your goal is to write the JSON data to a file, use the function `dump` instead:

```py
import json

data = {"key1": True, "key2": [73, 42, 10]}

with open("myfile.json", "w") as f:
    json.dump(data, f)
```
