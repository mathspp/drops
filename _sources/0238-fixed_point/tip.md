---
themes:
    - "algorithms"
    - "assignment expressions"
    - "`:=` (walrus operator)"
---

(238)=
# 238 – Fixed point

You can apply a function `f` successively on a value `x` until applying the function doesn't change with the auxiliary function `fixedpoint`:

```py
def fixedpoint(f, x):
    while x != f(x):
        x = f(x)
    return x
```

The function `fixedpoint` computes the value `f(x)` twice for each given value of `x`.
If that is a significant performance hit, you can use an assignment expression to merge the comparison and the assignment:

```py
def fixedpoint(f, x):
    while x != (x := f(x)):
        pass
    return x
```

In the new version of the function `fixedpoint`, it is important that the comparison starts with `x != ...`, otherwise the function `fixedpoint` would be wrong.

Further reading:

 - Assignment expressions and the walrus operator, <https://mathspp.com/blog/pydonts/assignment-expressions-and-the-walrus-operator>
