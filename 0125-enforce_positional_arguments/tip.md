---
themes:
    - "functions"
    - "positional arguments"
    - "forward slash `/`"
    - "readability"
---

(125)=
# 125 – Enforce positional arguments

You can use the forward slash `/` in a function signature to force arguments to be passed in as positional only.
In other words, use `/` to disallow arguments from being passed as keyword arguments.

This useful when the names of the arguments are inconsequential.
For example, in a mathematics context, `p` and `q` are very common names for polynomials, but the names themselves have no meaning.
So, if you're defining a function that adds two polynomials (using [the idiom to operate on two lists of numbers](124)), you might want `p` and `q` to only be passed in positionally:

```py
from itertools import starmap, zip_longest
from operator import add

def add_polynomials(p, q, /):
    """Function to add two polynomials as lists of coefficients."""
    return list(starmap(add, zip_longest(p, q, fillvalue=0)))

add_polynomials(poly1, poly2)  # Ok.
add_polynomials(p=poly1, q=poly2)  # TypeError!
```

Another example use case is from the [Cyclopts package](https://cyclopts.readthedocs.io/en/latest/), a package to create CLIs.
In Cyclopts, you [use the forward slash `/` to declare that a parameter is an argument and not an option](https://cyclopts.readthedocs.io/en/latest/vs_typer/argument_vs_option/README.html).
