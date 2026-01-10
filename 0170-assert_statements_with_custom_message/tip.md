---
themes:
    - "`assert`"
    - "exceptions"
    - "debugging"
---

(170)=
# 170 – `assert` statements with custom message

The keyword `assert` takes an expression on its right and then raises an `AssertionError` if that expression doesn't evaluate to `True` (or Truthy):

```py
x = 73
y = 42

assert y > x
```
```text
...
AssertionError
```

The error message can be customised if you add a string in front of the expression being checked, separating the two with a comma:

```py
x = 73
y = 42

assert y > x, f"{y=} isn't > {x=}..."
```
```text
...
AssertionError: y=42 isn't > x=73...
```

Clear error messages make life easier for the person who's dealing with the error (which is likely to be “you” from the future), so take a second to write a useful error message that you'll be thankful for.

Just remember to never use `assert` for security-related or sensitive checks, since there are ways to “turn off” the assertions and have Python run without verifying them.
