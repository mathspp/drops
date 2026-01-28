---
themes:
    - "mathematics"
    - "algorithm"
---

(180)=
# 180 – Fast exponentiation

Exponentiation, represented by `base ** exp` in Python, is shorthand for `exp - 1` multiplications of base with itself, but you can implement that computation without doing as many multiplications.

By using the binary expansion of the exponent, you can compute `base ** exp` with just $\log(exp)$ multiplications:

```py
def fast_pow(base, exp):
    acc = 1
    while exp:
        exp, mod = divmod(exp, 2)
        if mod:
            acc *= base
        base **= 2
    return acc
```

This algorithm uses a technique called repeated squaring.
The code block below shows how the values of `acc`, `exp`, and `base`, evolve during the computation of `fast_pow(3, 9)`:

```text
acc   1 -> 3 ->  3  ->    3  -> 19683 -> done
exp   9 -> 4 ->  2  ->    1  ->     0
base  3 -> 9 -> 81  -> 6561  ->   ...
```
