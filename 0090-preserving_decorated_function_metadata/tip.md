---
themes:
    - "decorators"
    - "standard library"
    - "`functools`"
    - "`functools.wraps`"
---

## 90 – Preserving decorated function metadata

The standard way of writing a decorator involves creating a wrapper function for the decorated function, like so:

```py
def my_decorator(func):
    def wrapper(*args, **kwargs):
        ...  # Decorator code goes here.
    return wrapper
```

Following this strategy has the drawback of “erasing” important function metadata.

Suppose you apply the decorator `my_decorator` to a function:

```py
@my_decorator
def add(a, b):
    """Performs addition!"""
    return a + b
```

In doing so, the metadata of the function `add` was messed up.
Printing the function now shows a funky result:

```py
print(add)  # <function my_decorator.<locals>.wrapper at 0x102cb4510>
```

Similarly, using the built-in `help(add)` will reveal a cryptic help message:

```py
Help on function wrapper in module __main__:

wrapper(*args, **kwargs)
 Help on my_decorator.<locals>.wrapper line 1/3 (END) (press h for help or q to quit)
```

To fix this behaviour – which is technically correct but definitely unhelpful – you can use the decorator `functools.wraps` inside your decorator:

```py
import functools

def my_decorator(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        ... # Decorator code goes here...
    return wrapper
```

The usage of `functools.wraps` will ensure the metadata is passed on to the wrapper.
If you reapply the decorator `my_decorator` to a fresh function `add` you will see the result looks good:

```py
print(add)  # <function add at 0x102db19b0>
```

And using `help(add)` reveals:

```py
Help on function add in module __main__:

add(a, b)
    Performs addition!
 Help on add line 1/4 (END) (press h for help or q to quit)
```

Further reading:

 - [Decorators article](https://mathspp.com/blog/pydonts/decorators).
