---
themes:
    - "generator expressions"
    - "assignment expressions"
    - "`:=` (walrus operator)"
    - "short-circuiting"
    - "debugging"
---

(233)=
# 233 – Tracking generator expression progress

**Assignment expressions** (using the **walrus operator** `:=`) used inside generator expressions can be used to keep track of the progress of the generator itself:

```py
_s = None
squares = ((_s := n) ** 2 for n in range(10))
```

The global variable `_s` is set to the value of `n` whenever the generator `squares` advances, as the following interaction shows:

```py
print(_s)  # None
next(squares)
next(squares)
print(_s)  # 1
next(squares)
next(squares)
print(_s)  # 3
```

This interaction is not recommended for production code but it can be helpful when trying to debug a generator expression.
An interesting example application is when using this technique with the built-ins `all` and `any` when they're fed a generator expression:

```py
numbers = [42, 0, 16, 73, 10]
all((odd := n) % 2 == 0 for n in numbers)
print(odd)  # 73
```

Since the built-ins `all` and `any` short-circuit, the variable `odd` will hold the first odd number from the list `numbers`.
If the list `numbers` didn't have any odd numbers, it would have the value of the _last_ number in the list.
