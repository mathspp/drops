---
themes:
    - generators
    - "`StopIteration`"
---

## 30 – Return value of a generator

Generators can return a final value once they're finished:

```py
def my_generator_function():
    yield 1
    yield 2
    return 73
```

This final value is then attached to the exception `StopIteration` that is raised when the generator is exhausted:

```py
gen = my_generator_function()
print(next(gen), next(gen))  # 1 2

next(gen)  # StopIteration: 73
```

You can extract this final value from the attribute `value`:

```py
gen = my_generator_function()
print(next(gen), next(gen))  # 1 2

try:
    next(gen)
except StopIteration as err:
    print(err.value)  # 73
```

Useful, for example, if you want your generator to produce some final summary statistics.
