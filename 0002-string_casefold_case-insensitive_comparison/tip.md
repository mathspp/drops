---
themes:
    - "strings"
    - "casing"
    - "`str.casefold`"
---

## 2 – Case-insensitive string comparisons

To perform case-insensitive string comparisons in Python, use the method `str.casefold`.
This method exists precisely to let you perform case-insensitive comparisons.

You need it because [some characters in some languages are kinda funky](https://mathspp.com/blog/how-to-work-with-case-insensitive-strings#don-t-use-str-lower-for-caseless-comparison)!
(That's the technical term – funky.)

Using `lower` or `upper` for case-insensitive comparisons only works if you're working with strings that are 100% guaranteed to only contain ASCII characters.
If you are working with Unicode, you need `casefold`.

Here is a small example using the German word for “street”.
First, note how the string “straße” appears to be lowercase, but if you uppercase it and then lowercase it, you end up with a different string:

```py
print("straße".lower())
# straße

print("straße".upper().lower())
# strasse
```

Now, note how the method `casefold` works just fine:

```py
print("STRASSE".casefold() == "straße".casefold())
# True

print("straße".casefold())
# strasse
```

Further reading:

 - [How to work with case-insensitive strings](https://mathspp.com/blog/how-to-work-with-case-insensitive-strings)
