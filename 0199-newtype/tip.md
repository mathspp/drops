---
themes:
    - "typing/type hints"
    - "`typing` (module)"
    - "`typing.NewType`"
    - "unpacking"
---

## 199 – `typing.NewType`

Sometimes you are dealing with lots of data of the same type (e.g., strings) but they all have different meanings.
For example, a person's name is very different from their email.
You can use `NewType` to create types that differentiate the different meanings so that the type checker can help you find bugs in your program.

Can you spot the bug in the code below?

```py
def send_email(email: str, body: str) -> bool:
    msg = EmailMessage(to=email, body=body)
    return msg.send()
    
data: tuple[str, str, str] = (
    "John",
    "john@example.com",
    "Hi John!",
)

email, name, body = data
send_email(email, body)  # Type checks!
```

The problem is that the unpacking `email, name, body = data` is wrong and you're thus passing the person's name as the email address to the function `send_email`.
The type checker could find this bug for you if you had a `NewType` specifically for the email field:

```py
from typing import NewType

Email = NewType("Email", str)
```

Now you update the signature of `send_email` to use `Email`:

```py
def send_email(email: Email, body: str) -> bool:
    ...
```

Finally, you update the type hint of `data` to signal where the `Email` goes:

```py
data: tuple[str, Email, str] = (
    "John",
    Email("john@example.com"),
    "Hi John!",
)
```

You use `Email` around the string so that the type checker sees that string as an email.
Now, the static type checker would catch the mistake in the unpacking that follows.

Note that `NewType` does not do any runtime validation, so something like `Email(73)` is perfectly valid at runtime (but not at static type-checking time).
