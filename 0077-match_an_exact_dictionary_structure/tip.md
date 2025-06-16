---
themes:
    - "structural pattern matching"
    - "dictionaries"
    - "match statement"
    - "guards"
    - "asterisk `*`"
    - "kwargs"
---

## 77 – Match an exact dictionary structure

Structural pattern matching can be used to match dictionaries with given keys and values.

By default, patterns with dictionaries only determine keys and values that a dictionary _must_ contain to match.
This means dictionaries can have more keys/values than the ones listed, and they still match.

If you wish to match a specific, restricted dictionary structure (that is, if you want to disallow dictionaries from having more key/value pairs), you can use a guard.

For example, consider the following `match` statement:

```py
match d:
    case {"name": str()}:
        print("match!")
```

The two dictionaries below would match, even though the second one has a key `"age"` that is not mentioned in the pattern above.

```py
{"name": "John"}  # ✅
{"name": "John", "age": 42}  # ✅
```

To only match dictionaries that have exactly that structure, introduce a guard with `**kwargs` that asserts that there are no extra keys:

```py
match d:
    case {"name": str(), **kwargs} if not kwargs:
        print("match!")
```

With this guard, the longer dictionary will not match.

Further reading:

 - [Structural pattern matching tutorial](https://mathspp.com/blog/pydonts/structural-pattern-matching-tutorial).
 - [Structural pattern matching cheatsheet](https://mathspp.gumroad.com/l/cheatsheet_match_statement?layout=profile).
