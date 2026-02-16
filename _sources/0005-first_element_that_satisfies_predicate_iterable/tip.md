---
themes:
    - "iterables"
    - "`next`"
    - "generator expressions"
    - "`StopIteration`"
---

(5)=
# 5 – First element that satisfies a condition

When you have an iterable and need to find the first element that satisfies a condition, you can use a generator expression and the built-in `next` to fetch that first element.

The generic recipe looks like this:

```py
first = next(elem for elem in iterable if condition(elem))
```

This is a good idea because the generator expression/`next` combo ensures you only search until you find the element you care about.
This means that you don't have to compute the condition on the values that come after the value that you wanted.


```py
important_numbers = [42, 73, 10, 16, 0]
print(
    next(n for n in important_numbers if n % 2)
)  # 73
```

If there's no such element, you'll either

 1. get a `StopIteration` you need to handle:

```py
important_numbers = [42, 10, 16, 0]
try:
    print(
        next(n for n in important_numbers if n % 2)
    )
except StopIteration:
    print("No odd numbers found!")
# No odd numbers found!
```

 2. pass a default/sentinel value to `next` as its second argument:

```py
important_numbers = [42, 10, 16, 0]
print(
    next(
        n for n in important_numbers if n % 2,
        None,
    )
)  # None
```
