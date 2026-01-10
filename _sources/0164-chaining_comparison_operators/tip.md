---
themes:
    - "operators"
    - "syntax"
    - "readability"
    - "comparison operators"
---

(164)=
# 164 – Chaining comparison operators

Python has plenty of comparison operators:

 - `<`, `<=`, `>`, `>=`
 - `==`, `!=`
 - `in`, `not in`
 - `is`, `is not`

All of these comparison operators can be chained together.
For example, writing `floor <= value <= ceiling` is the same as writing `floor <= value and value <= ceiling`.

Chaining comparison operators can improve code readability, but only if

 - used in sequences of `<` / `<=` signs; or
 - used in sequences of `>` / `>=` signs.

Mixing different comparison operators will lead to code that is hard to parse.
For example, `value in mylist == True` looks like `(value in mylist) == True`, but it's actually `value in mylist and mylist == True`, which will always be false if `mylist` is a list.

Further reading:

 - [Chaining comparison operators](https://mathspp.com/blog/pydonts/chaining-comparison-operators)
