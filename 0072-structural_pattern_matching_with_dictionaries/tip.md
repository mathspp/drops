---
themes:
    - "structural pattern matching"
    - "match statement"
    - "dictionaries"
    - "validation"
---

(72)=
# 72 – Structural pattern matching with dictionaries

The `match` statement can be used to match keys and values in a dictionary, effectively matching the structure of the dictionary.

The example below matches all dictionaries that contain a key `"user"` with a string value and a key `"age"` with an integer value:

```py
match my_dict:
    case {"user": str(), "age": int()}:
        print("Match!")
```

Dictionaries that satisfy those restrictions will match, even if they have more key/value pairs, like the dictionary `my_dict` below:

```py
my_dict = {"user": "John", "age": 47, "children": 2}
```

The dictionaries below won't match, respectively because they're missing the key/value pair for `"age"` or because the value for `"age"` doesn't have the correct type:

```py
my_dict = {"user": "John"}  # Missing `"age"`
my_dict = {"user": "John", "age": "47"}  # `"age"` should be an integer.
```

Further reading:

 - [Structural pattern matching tutorial](https://mathspp.com/blog/pydonts/structural-pattern-matching-tutorial).
 - [Structural pattern matching cheatsheet](https://mathspp.gumroad.com/l/cheatsheet_match_statement).
