---
themes:
    - "floats"
---

(230)=
# 230 – Addition isn't commutative

When working with floating-point numbers keep in mind that addition isn't associative.
That is, in a chain of additions, the order in which you do them is important.

As an example, consider the following addition that produces the correct result:

```py
eps = 10**-16
print(eps + eps + 1)
# 1.0000000000000002
```

The addition above evaluates from left to right, so `eps + eps + 1` is the same as `(eps + eps) + 1`.
However, if you add parenthesis on the right, the result changes and becomes wrong:

```py
print(eps + (eps + 1))
# 1.0
```

You should be mindful of this when writing code that works with floating-point numbers, especially in sensitive contexts.

Further reading:

 - Precision of Python floats, <https://mathspp.com/blog/til/precision-of-python-floats>
