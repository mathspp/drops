---
themes:
    - "bitwise operators"
    - "`bin`"
---

(256)=
# 256 – Bit manipulations

Python defines six bitwise operations: left and right shifts, bitwise `AND`, bitwise `OR`, bitwise inversion, and bitwise `XOR`.
Elegant weapons for a more... civilised age.[^xkcd-297]

 - Bit shifting:

```py
bin(73)       # 0b1001001
bin(73 << 2)  # 0b100100100
bin(73 >> 2)  # 0b10010
```

Shifting left will add zeroes on the right of the binary representation of the number and shifting right will drop digits.

 - Bitwise `AND`:

```py
bin(73)       # 0b1001001
bin(37)       # 0b 100101
bin(73 & 37)  # 0b      1
```

Bitwise `AND` keeps `1`s in the positions that had exactly two `1`s.

 - Bitwise `OR` and `XOR`:

```py
bin(73)       # 0b1001001
bin(37)       # 0b 100101
bin(73 | 37)  # 0b1101101  # OR
bin(73 ^ 37)  # 0b1101100  # XOR
```

Bitwise `OR` keeps `1`s in the positions that had _at least_ one `1` while bitwise `XOR` keeps `1`s in the positions that had _exactly_ one `1`.

 - Bitwise inversion:

```py
bin(73)   #  0b1001001
bin(~73)  # -0b1001010
```

Bitwise inversion computes `-(x+1)`.

[^xkcd-297]: Kudos if you got the [xkcd 297](https://xkcd.com/297/) reference.
