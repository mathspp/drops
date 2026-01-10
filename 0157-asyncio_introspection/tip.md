---
themes:
    - "`asyncio`"
    - "asynchronous programming"
    - "CLI"
    - "standard library"
    - "3.14 (new in Python 3.14)"
---

(157)=
# 157 – `asyncio` introspection

You can use the `asyncio` CLI (new in Python 3.14) to inspect/debug running Python processes that use asynchronous tasks.
For example, take this tiny example of an asynchronous program in the file `my_code.py`:

```py
import asyncio

async def main():
    await asyncio.sleep(60)

asyncio.run(main())
```

If you run the program and the running process has the ID 12345, for example, then you can run

```bash
$ python -m asyncio pstree 12345
```

And you get a tree showing all currently-running `asyncio` tasks in a hierarchical format:

```
└── (T) Task-1
    └──  main /path/to/my_code.py:4
        └──  sleep /path/to/python/asyncio/tasks.py:702
```

The subcommand `ps` can be used instead of `pstree` to display this information in a table instead of in a tree.
