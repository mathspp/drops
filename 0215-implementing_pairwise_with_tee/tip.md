---
themes:
    - "iterables"
    - "`itertools`"
    - "`itertools.pairwise`"
    - "`itertools.tee`"
    - "algorithms"
    - "`zip`"
---

(215)=
# 215 – Implementing `pairwise` with `tee`

Before being added to Python 3.10, `itertools.pairwise` was commonly implemented in terms of `itertools.tee`:

```py
def my_pairwise(it):
    it1, it2 = tee(it, 2)
    next(it2)
    yield from zip(it1, it2)
```

This short implementation shows how elegantly the different built-ins and the iterators from `itertools` can be combined to express new ideas.
