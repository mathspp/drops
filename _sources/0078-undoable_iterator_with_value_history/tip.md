---
themes:
    - "iterables"
    - "standard library"
    - "`collections` (module)"
    - "`collections.deque`"
    - "iterator protocol"
---

(78)=
# 78 – Undoable iterator with value history

You can use a `deque` from the module `collections` to create an undoable iterator that keeps track of the history of seen values.

You use a `deque` to hold the history of values that have been seen and also create a `deque` to hold a queue of values that have been seen already but that were “undone”.

To fetch the next element from the iterator, ensure there's at least one value in the queue – which you might need to fetch from the original iterable – and then produce that.

To undo a step, you take one element from the history `deque` and plop it into the queue `deque`.

This is a sample implementation of the iterator `undoable` with no validation/error-checking:

```py
from collections import deque

class undoable:
    def __init__(self, iterable, hist_size=100):
        self.iterator = iter(iterable)
        self.history = deque(maxlen=hist_size)
        self.queued = deque(maxlen=hist_size)

    def __next__(self):
        if not self.queued:
            self.queued.append(next(self.iterator))
        item = self.queued.popleft()
        self.history.append(item)
        return item

    def undo(self):
        self.queued.appendleft(self.history.pop())

    def __iter__(self): return self  # necessary for the iterator protocol
```

The snippet below shows an usage example with a generator expression:

```py
squares = undoable(x ** 2 for x in range(3))

print(next(squares))  # 0
print(next(squares))  # 1

squares.undo()
squares.undo()

print(next(squares))  # 0
print(next(squares))  # 1
print(next(squares))  # 4
```
