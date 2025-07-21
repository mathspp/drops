---
themes:
    - "strings"
    - "f-strings"
    - "string formatting specification language"
    - "string formatting"
    - "`str.partition`"
---

## 48 – Redacting email addresses

You can use f-strings and the string formatting specification language to create an effect of redacted or private data.
For example, the function below redacts part of your email address:

```py
def redact_email(email):
    user, _, domain = email.partition("@")
    return f"{user[:2]:*<{len(user)}}@{domain}"

print(redact_email("rodrigo@mathspp.com"))
# ro*****@mathspp.com
```

The part that is doing the heavy lifting is the section `*<{len(user)}` inside the f-string formatting:

 1. `{len(user)}` uses the length of the variable `user` to determine the width of the field where `user[:2]` (the first two characters of the user) will be inserted;
 2. `<` tells Python to align `user[:2]` on the left of that field; and
 3. `*` tells Python to fill empty space with the character asterisk.

You could modify the function to also mask the domain, for example.

**Note**: for very security-sensitive use-cases, you might want to randomise the number of asterisks shown, instead of making the string match the correct length.
