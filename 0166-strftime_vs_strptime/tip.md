---
themes:
    - "`datetime` (module)"
    - "standard library"
    - "`datetime.date.strftime`"
    - "`datetime.date.strptime`"
    - "dates and times"
---

## 166 – `strftime` vs `strptime`

The methods `strftime` and `strptime` can be used to convert dates/times into strings and vice-versa.
Here's a mnemonic to help you remember which is which:

 - `strptime` has a “P” for “Parse date/time”, so it'll accept a string and parse a date/time from it:

```py
import datetime as dt

date = dt.date.strptime("2025-11-04", "%Y-%m-%d")
print(date)  # datetime.date(2025, 11, 4)
```

 - `strftime` has an “F” for “Format date/time”, so it'll accept a date/time and it will format it as a string:

```py
print(date).strftime("%Y-%m-%d")
# 2025-11-04
```
