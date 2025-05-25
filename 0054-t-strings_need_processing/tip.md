---
themes:
    - "strings"
    - "t-strings"
    - "security"
---

## 54 – t-strings need processing

t-strings were introduced in Python 3.14.

t-strings are a generalisation of f-strings that let you control the formatting process a bit more.
Their main use case is to allow for safer formatting when you're formatting user input that needs to be sanitised.
(C.f. the [ever-relevant xkcd comic 327](https://xkcd.com/327).)

It is up to the programmer to call a function that takes a t-string and processes its interpolated values.
In the example below, the programmer needs to use a function `interpolate_html_safe` to interpolate HTML safely, so as to avoid potential security issues arising from including arbitrary JavaScript in the final HTML:

```py
from string.templatelib import Template

def interpolate_html_safe(template: Template) -> str:
    ...  # Processes interpolated values...

to_format = "<script>alert('Malicious JS');</script>"
html_page = t"<html>{to_format}</html>"
print(interpolate_html_safe(html_page))
# <html>&lt;script&gt;alert('Malicious JS');&lt;/script&gt;</html>
#       ^^^^      ^^^^                      ^^^^       ^^^^
# Script tags were escaped when interpolating the string.
```
