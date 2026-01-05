---
themes:
    - "standard library"
    - "`base64` (module)"
    - "encodings"
    - "bytes"
---

## 202 – Base64 encoding

Base64 encodes binary data in a way that makes it safe to send over email, use on URL parameters, as HTTP POST requests, and more.
Python provides the module `base64` to work with it:

```py
from base64 import b64encode, b64decode

data = "What's up?"
encoded = b64encode(data.encode())

print(encoded)  # b'V2hhdCdzIHVwPw=='

print(b64decode(encoded).decode())  # What's up?
```

It's important to note that the functions from the module `base64` expect and return bytes objects.

(Base64 derives its name from the 64 characters it uses to encode data.)
