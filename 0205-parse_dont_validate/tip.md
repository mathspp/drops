---
themes:
    - "data processing"
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.NewType`"
    - "defensive programming"
---

(205)=
# 205 – Parse, don't validate

Whenever you are using validator functions you run the risk of forgetting to call the validator.
This means you'll be passing around data that might be invalid.

You can prevent this from happening by writing a “parser” function instead of a validator.
This “parser” accepts the data and, if it's valid, returns it as a new type.
Here's an example for email addresses:

```py
from typing import NewType

Email = NewType("Email", str)

def parse_email(email: str) -> Email:
    # Check if it's valid...
    return Email(email)
    
def login(email: Email): ...
```

Now, if you try to call `login` without passing through `parse_email`, your static type checker will complain:

```py
email = input("Enter an email >> ")
login(email)  # Type error!
```

The fix is calling `parse_email` first:

```py
email = input("Enter an email >> ")
email = parse_email(email)
login(email)
```


This is some example text.
This text is in **bold** and this is _italics_.

I have [a link](https://example.com).

Call the built-in function `print` and do this:

```py
import functools

print(functools)
```
