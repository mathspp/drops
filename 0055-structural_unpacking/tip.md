---
themes:
    - "unpacking"
    - "asterisk `*`"
    - "structural pattern matching"
---

## 55 – Structural unpacking

When doing an assignment, if the value on the right is an iterable (list, tuple, ...), you can unpack it.
On the left, you can write as many variables as elements you expect to have on the right.
You can also use the splat operator to capture lists of zero or more elements.

And you can nest these structural matches!

```py
colour = ("AliceBlue", (240, 248, 255, 255))
name, (*rgb, alpha) = colour

print(rgb)  # [240, 248, 255]
```

This also works with the assignment target in a `for` loop:

```py
colours = [colour, ...]

for name, (*rgb, alpha) in colours:
    print(name, rgb, alpha)

# AliceBlue [240, 248, 255] 255
# ...
```

Further reading:

 - [Structural unpacking blog article](https://mathspp.com/blog/pydonts/deep-unpacking).
