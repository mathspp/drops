---
themes:
    - "strings"
    - "string formatting specification language"
    - "f-strings"
    - "readability"
    - "underscore `_`"
---

## 62 – Formatting big numbers

When doing string formatting with big integers, you may want to include thousands separators to make numbers easier to read.
You can add

 - commas;
 - underscores; or
 - a locale-appropriate separator.

To do so, use the specifiers `,`, `_`, or `n`, respectively:

```py
bignum = 123541241234

print(f"Big money ${bignum:,}")
# Big money $123,541,241,234

print(f"Big money ${bignum:_}")
# Big money $123_541_241_234

print(f"Big money ${bignum:n}")
# Big money $123541241234  # Might be different for you.
```

Note that the locale-appropriate separator might be “nothing”, as seen above.

Further reading:

 - [Thousands separators](https://mathspp.com/blog/til/thousands-separators).
