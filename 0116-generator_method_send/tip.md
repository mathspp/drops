---
themes:
    - "generators"
    - "`next`"
    - "iterables"
---

## 116 – Send data into generators

Generators have a method `send` that you can use to send data into the generator.
Inside the generator, that data comes from the expression `yield`, that evaluates to the value that was sent into the generator.

The example below shows a generator that produces consecutive integers.
However, if you send an integer into the generator, you'll skip ahead that many integers:

```py
def count():
    at = 0
    while True:
        skip = yield at
        if skip is not None:
            at += skip
        else:
            at += 1
```

Here's an example usage:

```py
counter = count()
print(next(counter))  # 0
print(next(counter))  # 1

print(counter.send(5))  # 6

print(next(counter))  # 7
```

Note how the return value of the method `send` is the next value produced by the generator.

When you use the built-in `next` to fetch the next value the result of the `yield` is None, because no value was sent to the generator.
