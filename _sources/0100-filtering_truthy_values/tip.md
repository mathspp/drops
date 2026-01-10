---
themes:
    - "`filter`"
    - "unexpected argument"
    - "truthy/falsy"
    - "falsy/truthy"
---

(100)=
# 100 – Filtering Truthy values

The built-in `filter` accepts the special value `None` as its first argument, instead of a predicate function.
When `None` is the first argument, `filter` will remove all Falsy values from the iterable passed as the second argument.

```py
words = ["This", "", None, "list", "contains", "", "some", "words"]

for word in filter(None, words):
    print(f"Word {word!r} has length {len(word)}.")
```
```
Word 'This' has length 4.
Word 'list' has length 4.
Word 'contains' has length 8.
Word 'some' has length 4.
Word 'words' has length 5.
```

In the snippet above, by using `filter(None, ...)`, the loop skips over the empty strings `""` in the list `words` and also the value `None`, since those are all Falsy.
