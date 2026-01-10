---
themes:
    - "REPL"
    - "underscore `_`"
---

(57)=
# 57 – Underscore in the REPL

When working in the REPL, the result of the last non-`None` expression is saved in the special variable `_` (underscore).

This is especially useful if you run a slow piece of code and forget to assign the result.
Just do `result = _`.

As someone who uses the REPL a lot, I find this to be very helpful!

Here is an example REPL session showcasing this feature:

```pycon
>>> 3 ** 3 ** 3
7625597484987
>>> print(_)
7625597484987

>>> _
7625597484987

>>> sum([_, _, -_, -_])
0
>>> _
0
```

Note that functions that return `None` do not update the value stored in `_`.

Further reading:

 - [The appearing built-in](https://mathspp.com/blog/til/the-appearing-builtin).
 - [Usages of the underscore](https://mathspp.com/blog/pydonts/usages-of-underscore).
