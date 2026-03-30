---
themes:
    - "list comprehensions"
    - "conditional expressions"
---

(253)=
# 253 – `if` in list comprehensions

There are two different ways to use the keyword if in list comprehensions but they mean completely different things.

Before the loop, you can use a conditional expression to _change the value_ that shows up in the final list:

```py
my_list = [
    num ** 2 if num % 2 == 0 else num
    for num in range(6)
]

print(my_list)  # [0, 1, 4, 3, 16, 5]
```

The original iterable was `range(6)`, which contains 6 elements, and the final list _also_ contains 6 elements.
Some of them were computed with the expression `num ** 2` and the other with the expression `num`.

After the loop, you can use a condition to _filter the values_ that show up in the final list:

```py
my_list = [
    num ** 2
    for num in range(6)
    if num % 2 == 0
]

print(my_list)  # [0, 4, 16]
```

The final resulting list only has 3 elements because the `if num % 2 == 0` was used to _filter out_ values from the result.

Further reading:

 - “Comprehending comprehensions” book, <https://mathspp.gumroad.com/l/comprehending-comprehensions>
