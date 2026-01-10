---
themes:
    - "strings"
    - "`str.startswith`"
    - "`str.endswith`"
    - "`str.removeprefix`"
    - "`str.removesuffix`"
---

(13)=
# 13 – String prefixes and suffixes

Strings have four convenience methods to replace some slicing: `startswith`, `endswith`, `removeprefix`, and `removesuffix`.

These methods are preferred over the slicing alternatives because they are more convenient and more readable.
(The methods `removeX` require Python 3.9+.)

Here are two examples operating on the start of a string:

```py
string = "Hello, world!"
print(string.startswith("Hello"))
# True
print(string.removeprefix("Hello"))
# , world!
```

The methods `startswith` and `endswith` also accept a tuple of strings to check:

```py
string = "abracadabra"
possible_prefixes = ("aa", "ab", "ac")
print(string.startswith(possible_prefixes))
# True
```
