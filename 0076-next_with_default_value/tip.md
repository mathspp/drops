---
themes:
    - "built-ins"
    - "unexpected additional argument"
    - "`next`"
    - "iterables"
    - "`StopIteration`"
---

## 76 – Built-in `next` with a default value

The built-in `next` can be given a second argument which is the default return value used when the given iterator is empty.
A default value (of `None`, for example) tends to be more useful in idioms that use next.
(For example, see [this tip about the first element of an iterable that satisfies a condition](#first-element-that-satisfies-a-condition).)

As an example, consider the generator expression assigned to `squares` and that is exhausted by calling the built-in `next` repeatedly:

```py
squares = (x ** 2 for x in range(3))

print(next(squares))  # 0
print(next(squares))  # 1
print(next(squares))  # 4
```

The next time that the built-in `next` is called, Python raises a `StopIteration`:

```py
print(next(squares))
# StopIteration
```

However, if you pass a second argument to the built-in `next`, that's the result you get:

```py
print(next(squares, "✨"))
# ✨
```
