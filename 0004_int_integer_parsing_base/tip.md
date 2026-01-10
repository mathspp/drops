---
themes:
    - "`int`"
    - "number bases"
---

(4)=
# 4 – Parsing integers from different bases

The built-in `int` can be used to parse integers from binary, octal, hexadecimal, and many other bases.
To do this, you need to specify the base you want as the second argument of `int`.

The valid bases are 2 through 36.
(You use 2 for binary, 8 for octal, and 16 for hexadecimal.)

```py
print(int("13"))  # 13
print(int("101", 2))  # 5
print(int("ff", 16))  # 255
```

The second argument can also be the special value 0, which tells `int` to “guess” the base by parsing the integer as it if were an integer literal.
(It “guesses” the base if you use the base prefix: `0b` for binary, `0o` for octal, `0x` for hexadecimal, and no prefix for decimal.)

```py
print(int("0b101", 0))  # 5
print(int("0xff", 0))  # 255
```

Further reading:

 - [Base conversion in Python](https://mathspp.com/blog/base-conversion-in-python).
