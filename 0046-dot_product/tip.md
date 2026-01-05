---
themes:
    - "standard library"
    - "`operator` (module)"
    - "`operator.mul`"
    - "`zip`"
    - "`sum`"
    - "`map`"
    - "`itertools`"
    - "`itertools.starmap`"
    - "`strict` (keyword argument)"
    - "3.14 (new in Python 3.14)"
---

## 46 – Dot product idiom

The [dot product](https://en.wikipedia.org/wiki/Dot_product) is a mathematical operation that can be computed with a simple Python idiom using the module `operator`:

```py
import operator

sum(map(operator.mul, vec1, vec2))
```

The snippet above assumes `vec1` and `vec2` are iterables that represent vectors.
This idiom was present in the documentation of the module `itertools` up to Python 3.11.

Then, in Python 3.12, the built-in `zip` got the keyword argument `strict`, which made the idiom evolve into something that looks a bit more complicated:

```py
from itertools import starmap
import operator

sum(starmap(operator.mul, zip(vec1, vec2, strict=True)))
```

We're using `zip(..., strict=True)` to ensure the vectors have the same size and `zip` produces tuples, so `starmap` is being used to “unpack” that tuple into the two arguments to `operator.mul`.

Then, in Python 3.14, the built-in `map` got a similar keyword argument `strict`, which means the idiom can go back to its simpler form with the extra safety check:

```py
import operator

sum(map(operator.mul, vec1, vec2, strict=True))
```
