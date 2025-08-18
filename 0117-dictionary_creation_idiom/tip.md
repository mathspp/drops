---
themes:
    - "idioms"
    - "dictionaries"
    - "`dict`"
    - "`zip`"
    - "iterables"
    - "built-ins"
---

## 117 – Dictionary creation idiom

Dictionaries can be created from iterables of key/value pairs, which naturally gives rise to a useful idiom to create dictionaries using the built-ins `zip` and `dict`.

Instead of iterating over two iterables, each containing all keys or all values:

```py
my_dict = {}
for key, value in zip(keys, values):
    my_dict[key] = value
```

Or even instead of using a dictionary comprehension:

```py
my_dict = {key: value for key, value in zip(keys, values)}
```

You can use the built-ins `dict` and `zip`:

```py
my_dict = dict(zip(keys, values))
```

Here's a concrete example:

```py
prompts = ["age", "country", "favourite language"]
answers = [28, "Portugal", "Python"]

info = dict(zip(prompts, answers))
print(info)
```
```
{
    'age': 28,
    'country': 'Portugal',
    'favourite language': 'Python',
}
```
