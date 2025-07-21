---
themes:
    - "strings"
    - "casing"
    - "`str.casefold`"
    - "`sorted`"
    - "`key` (keyword argument)"
    - "Unicode"
---

## 89 – Natural alphabetical sorting

Strings can be sorted in Python and the default behaviour is to sort lexicographically, character by character.
However, characters are compared by their Unicode codepoint (which you can check with the built-in `ord`), which means upper case letters and lower case letters are separated because their codepoints are “far” apart:

```py
fruits = ["banana", "APPLE", "Coconut"]
print(sorted(fruits))
# ['APPLE', 'Coconut', 'banana']
```

The lower case letters come after the upper case letters because the lower case letters have higher codepoints:

```py
print(ord("C"))  # 67
print(ord("b"))  # 98
```

If you want to sort a series of strings in a case-insensitive way, you can use the built-in `sorted` and set the keyword parameter `key` to the string method `str.casefold`:

```py
fruits = ["banana", "APPLE", "Coconut"]
print(sorted(fruits, key=str.casefold))
# ['APPLE', 'banana', 'Coconut']
```


Further reading:

 - [How to work with case-insensitive strings](https://mathspp.com/blog/how-to-work-with-case-insensitive-strings)
