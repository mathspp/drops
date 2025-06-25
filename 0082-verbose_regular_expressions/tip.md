---
themes:
    - "regex"
    - "standard library"
    - "regex flags"
    - "strings"
    - "multiline strings"
    - "`re`"
    - "readability"
    - "newlines"
    - "backslash `\\`"
---

## 82 – Verbose regular expressions

This is the best thing you can do for your regular expressions: use the verbose flag.
Verbose regular expressions can be split across multiple lines and you can add comments to it.
This makes it much easier to write readable regular expressions.

As an example, here is a not-so-complex regular expression:

```py
pattern = r"---\ntitle: (?P<title>.*?)\nauthor: (?P<author>.*?)\n---"
```

Here is an equivalent regular expression after using the verbose flag `(?x)`:

```py
pattern = r"""(?x)
    ---\n                         # frontmatter delimiter
    title:\ (?P<title>.*?)\n     # book title
    author:\ (?P<author>.*?)\n   # author name
    ---                           # frontmatter delimiter
"""
```

Note that, since whitespace is ignored, you need the explicit `"\n"` to match newlines and you also need to escape spaces with a backslash `\`.

The beauty of this example is that the verbose regular expression now looks much more like the text that it matches, for example:

```yaml
---
title: Moby Dick
author: Herman Melville
---
```

The verbose flag can also be used as `re.X` or `re.VERBOSE` when passing flags to the functions of the module `re`.
