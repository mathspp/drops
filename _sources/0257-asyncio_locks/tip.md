---
themes:
    - "`asyncio`"
    - "asynchronous programming"
    - "`asyncio.Lock`"
    - "`async with`"
---

(257)=
# 257 – `asyncio` locks

The module `asyncio` provides a class `Lock` that you can use to guarantee exclusive access to a shared resource:

```py
from asyncio import Lock

lock = asyncio.Lock()
```

Use it with an `async with` statement:

```py
async def coroutine1():
  async with lock:
      ...  # Access the shared state.

async def coroutine2():
  async with lock:
      ...  # Access the shared state.
```

Since both coroutines use `lock`, they can't enter the `async with` at the same time.

Like with any other synchronisation primitive, you have to be careful about deadlocks.
