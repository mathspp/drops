---
themes:
    - "strings"
    - "standard library"
    - "`unicodedata` (module)"
    - "`unicodedata.normalize`"
    - "`unicodedata.category`"
    - "ASCII"
    - "Unicode"
---

## 33 – Normalise strings by removing accents

My name is “Rodrigo Girão Serrão” and the “~” on top of the As are standard in Portuguese…
And just like the “~”, there are hundreds of other accents and weird marks used by hundreds of other languages!

If you don't want any of it, you can write a short Python function that gets rid of those:

```py
import unicodedata

def remove_accents(string):
    return  "".join(
        char for char in unicodedata.normalize("NFD", string)
        if unicodedata.category(char) != "Mn"
    )
```

This function can be useful when writing a “slugify” function, for example:

```py
def slugify(string):
    return remove_accents(string).lower().replace(" ", "-")

print(slugify("Rodrigo Girão Serrão"))  # rodrigo-girao-serrao
```

The function `remove_accents` leverages the built-in module `unicodedata`, which provides tools to work with the Unicode standard.

(In case you are wondering, the call `unicodedata.normalize("NFD", string)` separates the accents from the letters:)

```py
print(list(unicodedata.normalize("NFD", "äáàãñç")))
# ['a', '̈', 'a', '́', 'a', '̀', 'a', '̃', 'n', '̃', 'c', '̧']
```
