---
themes:
    - "JSON"
    - "`json` (module)"
    - "`json.dump`"
    - "`json.load`"
    - "data processing"
    - "filesystem"
    - "standard library"
---

(204)=
# 204 – Reading and writing JSON

You can use the module `json` to read and write data in the JSON format, which is very suitable to represent the most common Python built-in types like lists and dictionaries, strings, integers and floats, and Boolean values.

To write data in the JSON format to a file, use the function `json.dump`:

```py
import json

data = {
  "name": "Rodrigo",
  "newsletters": 2,
}

with open("data.json", "w") as f:
    json.dump(data, f)
```

The call to `json.dump` writes a file that looks like this:

```json
{"name": "Rodrigo", "newsletters": 2}
```

You can retrieve the data and convert it back to the appopriate Python types with `json.load`:

```py
import json

with open("data.json", "r") as f:
    data = json.load(f)
    
print(data)
```
```text
data = {
  "name": "Rodrigo",
  "newsletters": 2,
}
```
