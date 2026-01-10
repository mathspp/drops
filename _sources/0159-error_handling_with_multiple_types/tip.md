---
themes:
    - "3.14 (new in Python 3.14)"
    - "exception handling"
---

(159)=
# 159 – Error handling with multiple types

When doing error handling with a `try: ... except: ...` block, you can handle different exception types in two different ways.

If you have two or more exception types that can be handled in the same way, you can group those exception types in the same `except` statement:

```py
try:
    some_code()
except (ValueError, TypeError):
    do_something_universal()
```

In Python 3.14+, if you're not using the keyword `as`, you can omit the parentheses and write

```py
# ...
except ValueError, TypeError:
    do_something_universal()
```

If different exception types need to be handled differently, you can have multiple `except` statements:

```py
try:
    some_code()
except TypeError:
    do_something1()
except ValueError:
    do_something2()
```
