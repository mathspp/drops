---
themes:
    - "`itertools`"
---

## 53 – Module `itertools` categorisation

A good way to think about the module `itertools` is to remember it has five categories of iterables:

 1. reshaping iterables: `batched`, `chain`, `groupby`, `islice`, and `pairwise`;
 2. filtering iterables: `compress`, `dropwhile`, `filterfalse`, and `takewhile`;
 3. combinatorial iterables: `combinations`, `combinations_with_replacement`, `permutations`, and `product`;
 4. infinite iterables: `count`, `cycle`, and `repeat`; and
 5. tool-complementing iterables: `accumulate`, `starmap`, and `zip_longest`.

Knowing these five categories should help you remember what tools you have available.

(There's also `tee` in `itertools`, which manipulates iterables but isn't an iterable itself!)

Further reading:

 - [Module `itertools` overview](https://mathspp.com/blog/module-itertools-overview) blog article.
