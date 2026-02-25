---
themes:
    - "`@` (at operator)"
    - "OOP"
    - "dunder methods"
    - "__matmul__"
---

(236)=
# 236 – at (`@`) operator

Python supports the operator at (`@`), although it doesn't have any built-in behaviour.
To add at (`@`) support to your own objects, implement `__matmul__`:

```py
class Slime:
    def __init__(self, size):
        self.size = size

    def __matmul__(self, other):
        print("Combining slimes!")
        s = Slime(self.size + other.size)
        return s

s1 = Slime(10)
s2 = Slime(8)

slime = s1 @ s2   # Combining slimes!
print(slime.size) # 18
```

Since the at (`@`) operator is a binary arithmetic operator, you may also implement `__rmatmul__` (and `__imatmul__`) to fully specify its behaviour.

Further reading:

 - Overloading arithmetic operators with dunder methods, <https://mathspp.com/blog/pydonts/overloading-arithmetic-operators-with-dunder-methods>
