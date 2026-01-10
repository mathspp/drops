---
themes:
    - "dictionaries"
    - "`dict.fromkeys`"
    - "iterables"
    - "class methods"
---

(114)=
# 114 – `dict.fromkeys`

If you have an iterable of keys you can initialise a dictionary by using the class method `dict.fromkeys`, which creates a dictionary where all keys map to the value `None`:

```py
keys = ["name", "age", "address"]
person_info = dict.fromkeys(keys)

print(person_info)
```
```py
{
    'name': None,
    'age': None,
    'address': None,
}
```

If the default value `None` doesn't suit you, you can change it by passing a different default value as the second argument to `dict.fromkeys`:

```py
person_info = dict.fromkeys(keys, "")

print(person_info)
```
```py
{
    'name': "",
    'age': "",
    'address': "",
}
```

Be careful when passing mutable values as the default value, though:

```py
keys = ["a", "b", "c"]
my_dict = dict.fromkeys(keys, [])

my_dict["a"].append("Hello")
my_dict["b"].append("there")
print(my_dict["c"])  # ['Hello', 'there']
```

Further reading:

 - [Custom value in `dict.fromkeys`](https://mathspp.com/blog/til/custom-value-in-dictfromkeys).
