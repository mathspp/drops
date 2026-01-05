---
themes:
    - "caching"
    - "performance optimisation"
    - "standard library"
    - "`functools`"
    - "`functools.cache`"
    - "decorators"
    - "sets"
    - "`set`"
    - "`frozenset`"
    ---

## 87 – Caching sets and frozen sets

The built-in type `set` has a variant `frozenset` that is immutable and that you can use as a dictionary key, for caching purposes, or in other contexts where you require a hashable value.

As an example, suppose you have a function `products_with_tags` that searches for products in a store that have the given tags, and since the database of products is fairly stable, you want to cache these lookups.

You write the function with a cache:

```py
from functools import cache

@cache
def products_with_tags(tags):
    ...  # Send an API request,
    ...  # process the results, etc.
```

Since sets aren't hashable, you can't call this function with an argument of the built-in type `set`:

```py
tags = {"sale", "local"}
print(products_with_tags(tags))  # Exception
```

Since frozen sets are immutable, they can be made hashable, and thus they can be used here:

```py
tags = frozenset({"sale", "local"})
print(products_with_tags(tags))
```

Frozen sets support all operations that sets support and, in particular, they support very fast lookups/containment checks.

The only operations that frozen sets do not support are the set operations that modify the set in-place.

Further reading:

 - [Sets and frozensets](https://mathspp.com/blog/pydonts/set-and-frozenset).
