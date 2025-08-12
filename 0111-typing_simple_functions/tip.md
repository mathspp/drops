---
themes:
    - "typing/type hints"
    - "functions"
    - "higher-order functions"
    - "`collections.abc`"
    - "`collections.abc.Callable`"
    - "standard library"
---

## 111 – Type hints that refer to functions

When dealing with higher-order functions (functions that accept functions as arguments or that return functions), you can use `collections.abc.Callable` to add a type hint to the function that is an argument/the return value.

`Callable` takes two values:

 1. the list of types of the arguments of the callable; and
 2. the return type of the callable.

For example, `Callable[[str, bool], None]` is the type that refers to functions that accept a string and a Boolean value and return `None`.
