---
themes:
    - "standard library"
    - "`datetime` (module)"
    - "`datetime.date.today`"
    - "`datetime.datetime.now`"
    - "dates and times"
---

## 21 – Current date and time

The modue `datetime` has data types that you can use to represent pure dates or dates with times:

 1. `datetime.date`
 2. `datetime.datetime`

Each class has a class method that gives you an instance of that class with the current date (and time), respectively:

 1. `datetime.date.today`
 2. `datetime.datetime.now`

```py
import datetime as dt

today = dt.date.today()
print(today)  # 2025-04-05

now = dt.datetime.now()
print(now)  # 2025-04-05 19:29:13.437736
```
