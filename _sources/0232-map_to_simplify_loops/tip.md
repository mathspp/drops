---
themes:
    - "built-ins"
    - "`any` (built-in)"
    - "`all` (built-in)"
    - "short-circuiting"
    - "`map`"
---

(232)=
# 232 – `map` to simplify loops

The built-in `map` can be used to simplify loops when the structure of the loop is similar to a loop that implements another built-in, up to a function transformation.

For example, consider the loop that implements the built-in `any`:

```py
# one_truthy = any(values)
one_truthy = False
for v in values:
    if v:
        one_truthy = True
        break
```

The loop above goes through the iterable `values` looking for a value that is `True` or Truthy, at which point it sets `one_truthy` to `True` and stops.
It's similar to the loop below, that uses a custom predicate function to check against:

```py
one_truthy = False
for value in iterable:
    if predicate(value):
        one_truthy = True
        break
```

To still be able to use the built-in `any` here, you can use the built-in `map` to apply the predicate:

```py
one_truthy = any(map(predicate, iterable))
```

The fact that `map` is also lazy plays nicely with the fact that `any` will short-circuit.

A structurally similar thing can be done for a loop that implements the logic of the built-in `all`:

```py
all_truthy = True
for value in iterable:
    if not predicate(value):
        all_truthy = False
        break
```

Which can similarly be reduced to calling the built-in `all` after using the built-in `map`:

```py
all_truthy = all(map(predicate, iterable))
```

Further reading:

 - Boolean short-circuiting, <https://mathspp.com/blog/pydonts/boolean-short-circuiting>
