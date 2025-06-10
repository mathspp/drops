---
themes:
    - "conditional expressions"
---

## 70 – Extract assignments from conditionals

Instead of using a conditional to make an assignment, use a conditional expression.
This extracts the important operation (the assignment) out of the nesting of the `if: ... else: ...` statement, making it easier to spot the relevant part of the code.

If you're not used to conditional expressions, it's a matter of learning how to read them in English (or in your language).
The snippet below, using a conditional statement, reads “If the user is logged in, set their permissions to `"full"`, otherwise set them to `"guest"`.”:

```py
if logged_in:
    permissions = "full"
else:
    permissions = "guest"
```

If you use a conditional expression, it now reads as “Set the user permissions to `"full"` if the user is logged in, otherwise set them to `"guest"`.”:

```py
permissions = "full" if logged_in else "guest"
#^^^^^^^^^^^^^^^^^^^                           Set permissions to `"full"`
#                    ^^^^^^^^^^^^              if the user is logged in,
#                                 ^^^^^^^^^^^^ otherwise set them to `"guest"`.
```

Further reading:

 - [Conditional expressions](https://mathspp.com/blog/pydonts/conditional-expressions).
