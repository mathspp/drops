---
themes:
    - "`filter`"
---

(228)=
# 228 – Filter with a predicate

Suppose you have a predicate function and a loop that only acts on elements that satisfy the predicate:

```py
def predicate(value):
    ...  # returns True or False

for value in iterable:
    if predicate(value):
        ...
```

The body of the loop only acts on elements that satisfy the predicate.
In this case, you can use the built-in `filter` instead of spelling out the conditional statement:

```py
def predicate(value):
    ...
    
for value in filter(predicate, iterable):
    ...
```

By using the built-in `filter`, you're communicating early the intent to filter the data and to not act on the entirety of it.

This tip works well if the function `predicate` is already defined, or worth defining.
If you're working with a Boolean expression to determine which values to process, it's preferable to spell out the conditional statement.
