---
themes:
    - "exception handling"
    - "idioms"
    - "standard library"
    - "`contextlib`"
    - "context managers"
    - "`contextlib.suppress`"
---

(122)=
# 122 – Ignore exceptions

The module `contextlib` provides a context manager `suppress` that you can use to suppress (ignore) a given exception.
Very helpful when you want to run some code, hoping it works, but when you really don’t care if it ends up failing.
You can read this idiom exactly as “it's ok if this fails”:

```py
from contextlib import suppress

with suppress(SomeException):
    run_some_code()
```

This is better than using `except SomeException: pass` because suppress conveys the meaning “ignore the exception” immediately, whereas using `try: ... except: pass` only shows that information much later:

```py
try:
    run_some_code()
except SomeException:
    pass
```

Further reading:

 - [Ignoring exceptions with `contextlib.suppress`](https://mathspp.com/blog/ignoring-exceptions-with-contextlib-suppress)
