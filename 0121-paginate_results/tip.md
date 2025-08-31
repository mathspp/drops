---
themes:
    - "generators"
    - "standard library"
    - "`itertools`"
    - "`itertools.batched`"
    - "3.12 (new in Python 3.12)"
    - "iterables"
    - "decorators"
---

## 121 – Paginate results

You can use `itertools.batched` to paginate an arbitrary iterable.
For example, you can take a generator that produces single values and turn it into a generator that produces “pages” of results.

You can even do this with an auxiliary generator:

```py
def paginated(function):
    def wrapper(*args, **kwargs):
        yield from batched(function(*args, **kwargs), 10)
    return wrapper
```

Here's an example application:

```py
@paginated
def evens():
    at = 0
    while True:
        yield at
        at += 2

for page in evens():
    print(page)
# (0, 2, 4, 6, 8, 10, 12, 14, 16, 18)
# (20, 22, 24, 26, 28, 30, 32, 34, 36, 38)
# ...
```
