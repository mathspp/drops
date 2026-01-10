---
themes:
    - "bitwise operators"
    - "sets"
    - "`assert`"
---

(201)=
# 201 – Check if a number is a power of 2

You can use a clever bitwise AND (`&`) to quickly and efficiently check if a number is a power of 2:

```py
def is_power_of_two(n):
    return n > 0 and (n & (n - 1)) == 0
```

This is much more efficient than using something like `math.log2`.

The diagram below helps visualise this operation for `n = 64`:

```
    n = 64 = 1000000
n - 1 = 63 = 0111111
   64 & 63 = 0000000
```

You can also quickly test the function `is_power_of_two` on every single integer from 0 up to whatever limit you establish:

```py
powers_of_two = {2 ** n for n in range(20)}

assert set(filter(is_power_of_two, range(2 * max(powers_of_two)))) == powers_of_two
```
