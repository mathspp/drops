---
themes:
    - "filesystem"
    - "iterables"
    - "unpacking"
    - "file I/O"
    - "CSV"
---

(229)=
# 229 – Split file header from the body

Since files are iterables, you can use features like unpacking on files:

```py
with open("my_data.csv") as f:
    header, *body = f

columns = header.count(",") + 1
rows = len(body)

print(f"CSV file has {rows} rows and {columns} columns.")
```

The line `header, *body = f` unpacks the first line into the variable `header` and all remaining lines into the variable `body`.

This trick isn't a replacement for the module `csv`, but can come in handy for a quick & dirty analysis in the REPL.
