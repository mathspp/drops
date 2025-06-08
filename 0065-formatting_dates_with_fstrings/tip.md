---
themes:
    - "f-strings"
    - "standard library"
    - "dates and times"
    - "`datetime` (module)"
---

## 65 – Formatting dates with f-strings

Dates, times, and datetime objects, from the module `datetime`, can be formatted directly in f-strings.

You don't need to use `strptime`.
Or `strftime`, whichever one of these two does the formatting.

The format specifier can contain the special codes with `%` to refer to parts of the date but anything else is left untouched.

```py
from datetime import date

print(f"{date.today():%Y-%m-%d}")
# 2025-06-03

print(f"{date.today():%Y---%m :: %d}")
# 2025---06 :: 03
```


Further reading:

 - [Datetime objects and f-strings](https://mathspp.com/blog/twitter-threads/datetime-objects-and-f-strings).
