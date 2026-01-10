---
themes:
    - "filesystem"
    - "standard library"
    - "`datetime` (module)"
    - "`datetime.datetime.now`"
    - "dates and times"
    - "date and time format specifiers"
    - "string formatting"
---

(91)=
# 91 – Timestamp file names

You can combine `datetime.datetime.now` with string formatting to add a timestamp to a file name.
This is very helpful to create unique file names dynamically.

Here is an example function using this idea:

```py
import datetime

def make_file_name(prefix, extension):
    ts = f"{datetime.datetime.now():%Y%m%d%H%M%S}"
    return f"{prefix}{ts}{extension}"
    
print(make_file_name("screenshot_", ".png"))
# screenshot_20250707142204.png
```

The `%` specifiers determine what parts of the current date and time make it to the timestamp and this example uses six:

| Specifier | Meaning |
| - | - |
| `%Y` | year |
| `%m` | month |
| `%d` | day |
| `%H` | hour |
| `%M` | minute |
| `%S` | second |

All but `%Y` result in a 2-digit number which might be 0-padded.

For most applications, going down to the minutes or seconds is enough.
If you need microseconds, you can add the specifier `%f`.
