---
themes:
    - "standard library"
    - "`itertools`"
    - "`itertools.accumulate`"
    - "algorithms"
---

(140)=
# 140 – Compute partial sums with `accumulate`

`itertools.accumulate` computes partial sums of the given iterable.
Or, in other words, `accumulate` computes prefix sums.

For example, if you give it a list of bank movements, `accumulate` computes the intermediate bank balances:

```py
from itertools import accumulate

movements = [100, -200, 300, -450]
initial_balance = 1000

for balance in accumulate(movements, initial=initial_balance):
    print(balance)
# 1000
# 1100 (1000 + 100)
# 900  (1100 - 200)
# 1200 (900 + 300)
# 750  (1200 - 450)
```

This shows there is a relationship between `accumulate` and the built-in `sum` if you consider slices of the list `movements` with the initial balance at the front:

```py
    [1000, 100, -200, 300, -450]
sum(     )                         # 1000
sum(          )                    # 1100
sum(                )              # 900
sum(                     )         # 1200
sum(                            )  # 750
```
