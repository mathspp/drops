---
themes:
    - "strings"
    - "`str.partition`"
    - "`str.rpartition`"
    - "`str.split`"
    - "truthy/falsy"
    - "falsy/truthy"
---

## 68 – Split strings in two halves

Sometimes you'll need to split the string in two halves.
When that's the case, you'll want to use the method `partition`:

```py
email = "rodrigo@mathspp.com"
user, at, domain = email.partition("@")

print(user)  # rodrigo
print(at)  # @
print(domain)  # mathspp.com
```

If the split fails, the first item of the 3-item tuple contains the full string and the two other items are the empty string:

```py
email = "mathspp.com"
user, at, domain = email.partition("@")

print(user)  # mathspp.com
print(at == domain == "")  # True
```

This is better than using `.split(..., maxsplit=1)` because the return type makes it easier to check if the split was successful.
With `partition`, it's enough to check if the middle element is truthy or not:

```py
email = input(" >>> ")
user, at, domain = email.partition("@")

if at:
    print("Split successful!")
else:
    print("Split was not successful!")
```

If the separator occurs 2+ times, `partition` splits on the first.
Use `rpartition` to split on the last:

```py
print("aaa oi bbb oi ccc".partition("oi"))
# ('aaa ', 'oi', ' bbb oi ccc')

print("aaa oi bbb oi ccc".rpartition("oi"))
# ('aaa oi bbb ', 'oi', ' ccc')
```
