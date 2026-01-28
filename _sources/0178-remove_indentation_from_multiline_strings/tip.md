---
themes:
    - "text processing"
    - "`textwrap`"
    - "`textwrap.dedent`"
    - "multiline strings"
---

(178)=
# 178 – Remove indentation from multiline strings

When you define a multiline string, you naturally get the indentation of the code that surrounds your string:

```py
if show_instructions:
    instructions = """
        Instructions:
        Write Python.
    """
    print("Hey!")
    print(instructions)
```
```output
Hey!

        Instructions:
        Write Python.
```

The instructions are indented because of the leading whitespace associated with the indentation of the `if` block they were defined in.

One way to fix this issue would be by deleting the indentation from the string yourself:

```py
if show_instructions:
    instructions = """
Instructions:
Write Python.
"""
    print("Hey!")
    print(instructions)
```
```output
Hey!

Instructions:
Write Python.
```

The problem with this solution is that the dedentend string breaks the flow of the code and makes it harder to understand the hierarchy of the code blocks.

A better fix for the indentation issue uses `textwrap.dedent`:

```py
from textwrap import dedent

if show_instructions:
    instructions = dedent(
        """
        Instructions:
        Write Python.
        """
    )
    print("Hey!")
    print(instructions)
```
```output
Hey!

Instructions:
Write Python.
```

`dedent` figures out how much indentation leading indentation is common to every line and removes it, allowing you to define multiline strings more conveniently.
