---
themes:
    - "strings"
    - "algorithms"
    - "text processing"
---

## 169 – Oxford comma

The function below turns a list of strings into a Human-readable enumeration that uses the Oxford comma:

```py
def oxford_comma(strings):
    prefix = ", ".join(strings[:-1])
    ox_comma = "," if len(strings) > 2 else ""
    and_ = " and " if len(strings) > 1 else ""
    last = strings[-1] if strings else ""
    return prefix + ox_comma + and_ + last
```

Example usages:

```py
print(oxford_comma(["like"]))
# like
print(oxford_comma(["like", "comment"]))
# like and comment
print(oxford_comma(["like", "comment", "subscribe"]))
# like, comment, and subscribe
```

The function `oxford_comma` demonstrates a useful technique for when you're building complex strings.

Instead of using multiple `if` statements to conditionally append parts of the string to the result, build the final string out of smaller fragments.
Then, a fragment that is unnecessary can be set to the empty string.

This keeps your code flatter and cleaner.
