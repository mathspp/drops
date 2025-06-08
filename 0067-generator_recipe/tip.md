---
themes:
    - "generators"
---

## 67 – Generator recipe

Generators are an awesome Python feature because their potential upside in terms of memory and time savings is infinite.

If you don't have experience writing generators, it's actually “easy” with this little trick.

First, you write a function that builds a list with the elements that you want to produce.
Then, you follow these three steps:

 1. Replace all calls to `.append(value)` with `yield value`.
 2. Delete the line where you initialised the list with the results.
 3. Delete the line where you return the list with the results.

That's it!

For example, start with this function:

```py
def squares(stop):
    result = []
    for n in range(stop):
        result.append(n ** 2)
    return result

print(squares(5))  # [0, 1, 4, 9, 16]
```

Then, you should get this generator:

```py
def squares(stop):
    # result = []
    for n in range(stop):
        yield n ** 2  # result.append(n ** 2)
    # return result

print(list(squares(5)))  # [0, 1, 4, 9, 16]
```

This trick also works for infinite generators if you start by writing a loop that builds an infinite list.
The function won't work because you can never build an infinite list, but the 3-step process can be applied and the resulting generator works.
