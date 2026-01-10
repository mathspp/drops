---
themes:
    - "`sum`"
    - "`map`"
    - "generator expressions"
---

(45)=
# 45 – Counting values that satisfy a predicate

(This is my favourite line of Python code. Really.)

To count the values of an iterable that satisfy a given predicate (a function that returns `True`/`False`) or a given condition, use the built-in `sum` and a generator expression:

```py
sum(predicate(value) for value in iterable)
```

This idiom works in 3 parts:

 1. the generator expression goes over all values you want to consider;
 2. `predicate(value)` evaluates the condition, producing `True` or `False`; and
 3. the built-in `sum` accumulates all the Boolean values, effectively counting the number of `True`s.

If you actually have a predicate function, you might prefer the version `sum(map(predicate, iterable))`.
If you want to use an ad-hoc expression as the condition, then use the generator expression:

```py
ages = [42, 73, 16, 10, 4, 6]

can_vote = sum(age > 18 for age in ages)
print(can_vote)  # 2
```
