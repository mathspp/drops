---
themes:
    - "list comprehensions"
    - "generator expressions"
    - "`str.join`"
    - "performance optimisation"
---

(234)=
# 234 – `join` with a comprehension

When passing an iterable to the string method `join` in performance-sensitive scenarios, a list comprehension is more performant than a generator expression.
In other words, prefer something like

```py
", ".join([str(num) for num in numbers])
```

over

```py
", ".join( str(num) for num in numbers )
          #                           #
```

Generator expressions are usually more performant than list comprehensions, but because of the way `join` is implemented, a list comprehension tends to be faster in this context.

While the list comprehension is faster, note that both options are already very fast and the difference won't be relevant in many scenarios.
And remember: for performance-sensitive code, always run your own benchmarks!
