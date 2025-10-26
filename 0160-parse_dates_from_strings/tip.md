---
themes:
    - "date and time format specifiers"
    - "3.14 (new in Python 3.14)"
    - "`datetime` (module)"
    - "dates and times"
    - "`datetime.date`"
    - "`datetime.date.strptime`"
    - "strings"
    - "class methods"
    - "standard library"
---

## 160 – Parse dates from strings

You can use the class method `datetime.date.strptime` to parse a date from a string with the given format:

```py
import datetime as dt

date_str = "26/10/2025"

when = dt.date.strptime(date_str, "%d/%m/%Y")
print(f"{when:%B %d, %Y}")  # October 26, 2025
```

This method is new in Python 3.14 for the class `datetime.date`, but the classes `datetime.datetime` and `datetime.time` already supported `strptime`.
