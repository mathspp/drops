---
themes:
    - "performance optimisation"
    - "lists"
    - "standard library"
    - "`itertools`"
    - "`itertools.chain`"
---

(85)=
# 85 – Add lists together, fast

Adding (concatenating) two lists together is a “slow” operation because it requires creating a new list and “copying” the values from the two source lists to the third resulting list.
In performance-sensitive scenarios, it may be better to use `itertools.chain` to chain the two lists together, instead.

For example, suppose there's a scenario where you have a node from a tree-like structure and you need to traverse the tree up, from the current node up until the root.
You might write a `for` loop like the one below:

```py
for node in [this_node] + list(this_node.parents):
    pass
```

If this were performance-sensitive code, you'd be better off using `chain`:

```py
from itertools import chain

for node in chain([this_node], this_node.parents):
    pass
```

The second alternative is faster because:

1. `this_node.parents` doesn't need to be converted to a list; and
2. chaining doesn't copy values to a third container.

This piece of advice is generally applicable but if you're writing truly performance-sensitive code, don't forget to benchmark this change.

Further reading:

 - [Module `itertools` overview](https://mathspp.com/blog/module-itertools-overview).
 - [CPython pull request #112406](https://github.com/python/cpython/pull/112406).
