---
themes:
    - "typing/type hints"
    - "future import"
    - "3.14 (new in Python 3.14)"
---

## 153 – Forward references in annotations

Forward/cyclic references in Python type hints raise a `NameError` up until Python 3.13:

```py
class Node:
    next_node: Node

# NameError: name 'Node' is not defined.
```

You can fix this by turning the type hint `: Node` into a string `: "Node"` or by using a future import:

```py
from __future__ import annotations

class Node:
    next_node: Node
```

By using the future import, you are deferring the evaluation of the annotations and that allows you to write cyclic/forward references.

In Python 3.14, this became the default behaviour:

```py
# Python 3.14
class Node:
    next_node: Node
# No `NameError`.
```

Further reading:

 - [PEP 649 – Deferred Evaluation of Annotations Using Descriptors](https://peps.python.org/pep-0649/)
