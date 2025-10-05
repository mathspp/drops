---
themes:
    - "`secrets` (module)"
    - "`random` (module)"
    - "`secrets.token_urlsafe`"
    - "security"
---

## 144 – Safe random tokens

To create a URL-safe token in your web server, use `secrets.token_urlsafe`:

```py
from secrets import token_urlsafe

print(token_urlsafe())  # ScIFbN8Nc0NKLI40_8o0cMwkqRRFfVgGUE8kBgEkRf0
```

The function `token_urlsafe` accepts an integer for the number of random bytes to be generated, but that's not the same as the number of characters generated because of the way the random bytes are then turned into a URL-safe string:

```py
print(token_urlsafe(4))
# eWtWsw
```

Remember that the module `random` is for modelling/simulations, not for security-sensitive operations or for cryptography!
