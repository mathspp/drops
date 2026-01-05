---
themes:
    - "dunder methods"
    - "hashing"
    - "`__hash__`"
    - "`hash`"
---

## 96 – Common `__hash__` implementation

The [dunder method](https://mathspp.com/blog/pydonts/dunder-methods) can be implemented to make your instances hashable.
This will let you use your instances of your custom class in dictionaries, sets, caches, and other situations.

The most common approach to implement a reasonable `__hash__` is to create a tuple with all the “important attributes” of your instance and then using the hash of that tuple.

As a rule of thumb, these “important attributes” tend to be the ones you would use to determine if two instaces of your class are equal.
For example, consider the mockup class `Fraction`:

```py
class Fraction:
    def __init__(self, numerator, denominator):
        self._num = numerator
        self._den = denominator
        self._is_simplified = ...
```

The attribute `_is_simplified` will flag whether the fraction has been simplified to its lowest terms, like in `Fraction(1, 3)`, or not, like in `Fraction(3, 9)`.
(Note that `1/3` and `3/9` are the same number.)

The fractions `Fraction(1, 3)` and `Fraction(3, 9)` are equal, although their attribute `_is_simplified` is different, since you can use the attributes `_num` and `_den` to determine they have the same numerical value.

Hence, for the class `Fraction`, you would use the attributes `_num` and `_den` to implement `__hash__`:

```py
class Fraction:
    # ...

    def __hash__(self):
        return hash((self._num, self._den))
```

Note that, if two instances are considered equal, then their hashes _must be the same_.
