---
themes:
    - "truthy/falsy"
    - "`bool`"
---

(168)=
# 168 – Truthy and Falsy

All Python objects have a Truthy/Falsy value which dictates how that object will behaving in a Boolean context.

Most objects are Truthy, with a few exceptions.
For the built-in types, you usually have a specific value that is Falsy:

```py
# Falsy values:
0        # zero
0.0      # zero, as a float
""       # empty string
[]       # empty list
{}       # empty dictionari
set()    # empty set
tuple()  # empty tuple
None     # None
```

Note how the Falsy values are “empty” or stand for “nothing”.
All other values of the same corresponding types are Truthy:

```py
1, 2, -43              # any non-zero integer
0.1, 3.4, -3.1         # any non-zero float
"hi", "bye", "  "      # any non-empty string
[0], [[]], [1, 2]      # any non-empty list
{"a": "b"}             # any non-empty dictionary
{1, 2}, {False, True}  # any non-empty set
(0,), ([], True)       # any non-empty tuple
```

In case you are not sure, you can use the built-in `bool` to check the Truthy/Falsy value of an object:

```py
print(bool(None))  # False
```

But when used in Boolean contexts, like `if` statements or in expressions with the keywords `not`, `and`, and `or`, you don't need the built-in `bool` because the Truthy/Falsy values of objects are used automatically.

Further reading:

 - [Truthy, Falsy, and `bool`](https://mathspp.com/blog/pydonts/truthy-falsy-and-bool)
