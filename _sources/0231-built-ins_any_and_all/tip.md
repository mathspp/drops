---
themes:
    - "built-ins"
    - "`any` (built-in)"
    - "`all` (built-in)"
    - "short-circuiting"
---

(231)=
# 231 – Built-ins `any` and `all`

The built-in `any` can be used to check if any of the values in a given iterable are True (or Truthy).
The spelled-out loop

```py
one_truthy = False
for v in values:
    if v:
        one_truthy = True
        break
```

is equivalent to a single call to the built-in `any`:

```py
one_truthy = any(values)
```

Similarly, you can write a loop that checks if all values of the given iterable are `True` or Truthy:

```py
all_truthy = True
for v in values:
    if not v:
        all_truthy = False
        break
```

This is equivalent to the call

```py
all_truthy = all(values)
```

The keyword `break` is used to mimic the short-circuiting behaviour that both built-ins have, which means the argument iterable is only consumed up to where it's necessary.

Further reading:

 - Boolean short-circuiting, <https://mathspp.com/blog/pydonts/boolean-short-circuiting>
