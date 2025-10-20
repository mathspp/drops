---
themes:
    - "regex"
    - "regex flags"
    - "`re.Match.groupdict`"
    - "`re.match`"
    - "`re`"
    - "named groups"
    - "dictionaries"
    - "standard library"
    - "data processing"
    - "strings"
---

## 83 – Extracting text data into a dict

Regular expression matches from the module `re` have a method `groupdict` that allow you to create a dictionary with the named groups that your regular expression defines.

This is useful, for example, if you're extracting data from structured text and want to convert it to a more convenient format (a dictionary).

Suppose you have a number of files for copyright-free books with a frontmatter header and the markdown contents:

```yaml
---
title: Moby Dick
author: Herman Melville
---

[...]
```

You can define a regex pattern to extract the title and author information:

```py
pattern = r"""(?x)
    ---\n
    title:\ (?P<title>.*?)\n
    author:\ (?P<author>.*?)\n
    ---"""
```

Then, you can use the module `re` and any of its functions to search/find text.
If you get a match, you can use the method `groupdict` to create a dictionary with key/value pairs for every [named group](#named-groups-in-regex) you defined.
In the example above, that would be a dictionary with keys `"title"` and `"author"`:

```py
import re

print(
    re.match(pattern, text).groupdict()
)
# {'title': 'Moby Dick',
#  'author': 'Herman Melville'}
```

Further reading:

 - [`re.Match.groupdict`](https://mathspp.com/blog/til/re-match-groupdict).
