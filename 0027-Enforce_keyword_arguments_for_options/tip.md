---
themes:
    - "functions"
    - "keyword arguments"
    - "asterisk `*`"
---

## 27 – Enforce keyword arguments for options

You can use a single asterisk `*` in a function definition to force all following arguments to be keyword-only.

This is particularly helpful for arguments that act as options or as configuration values.
Here is an example with a function that can return the temperature in a room in two units, Celsius and Fahrenheit:

```py
def get_temperature(room, *, unit)
```

By using `*`, the second argument must be passed as a keyword argument:

```py
get_temperature("bedroom", unit="celsius")  # This works.
```

If you don't, you get an exception `TypeError`:

```py
get_temperature("bedroom", "celsius")  # TypeError
```
