---
themes:
    - "data structures"
    - "`list`"
    - "OOP"
    - "inheritance"
---

(173)=
# 173 – Using a list as a stack

When working with stacks, use the built-in `list` as the base class:

```py
class stack(list):
    def put(self, value):
        self.append(value)

    def peek(self):
        return self[-1]
```

This allows you to inherit useful behaviours for free, like length:

```py
s = stack()
s.put(1)
s.put(2)
s.put(3)

print(f"The stack has {len(s)} items.")
# The stack has 3 items.
```

Containment checks:

```py
print(3 in s)  # True
popped = s.pop()
print(3 in s)  # False
```

Truthy/Falsy behaviour:

```py
if s:
    print(f"{popped} was at the top.")
    print(f"Now it's {s.peek()}.")
# 3 was at the top.
# Now it's 2.
```

And more.
