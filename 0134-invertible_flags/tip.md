---
themes:
    - "standard library"
    - "`enum` (module)"
    - "`enum.Flag`"
    - "`~` (tilde)"
    - "bitwise operators"
---

(134)=
# 134 – Invertible flags

The special values `True` and `False` are tightly connected: they mean the opposite of each other and you can negate one to get the other:

 - `not True` gives `False`
 - `not False` gives `True`

You can create the same behaviour and the same semantics of “two opposite values” by using a flag enumeration with only two members with values `0` and `1`:

```py
from enum import Flag

class DoorState(Flag):
    CLOSED = 0
    OPEN = 1

print(~DoorState.CLOSED)  # DoorState.OPEN
print(~DoorState.OPEN)    # DoorState.CLOSED
```

The bitwise operator `~` (NOT) negates the flag, turning it into the opposite member.

You can also use the keyword `not` to do the negation, but in that case you need to reinstantiate the flag to make it a member of the enumeration again:

```py
print(DoorState(not DoorState.CLOSED))
# DoorState.OPEN
print(DoorState(not DoorState.OPEN))
# DoorState.CLOSED
```

Useful for user configurations where you want readable options!
