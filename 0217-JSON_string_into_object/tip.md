---
themes:
    - "JSON"
    - "`json` (module)"
    - "text processing"
    - "parsing"
---

(217)=
# 217 – Parse JSON string into object

You can parse a JSON string into a native Python object by using the function `loads` from the module `json`:

```py
import json

data = '{"hey": [42, null, false]}'

d = json.loads(data)
print(d)
```
```py
{'hey': [42, None, False]}
```

The function `loads` stands for _load s_tring, and is useful when the JSON data doesn't come from a file, for example when it's a payload from an API call.
