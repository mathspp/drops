---
themes:
    - "`asyncio`"
    - "asynchronous programming"
    - "`asyncio.Event`"
---

(254)=
# 254 – `asyncio` events

The module `asyncio` provides the class `Event` that you can use to synchronise multiple `asyncio` tasks.

You can create an event by simply instantiating the class:

```py
from asyncio import Event

local_files_ready = Event()
```

The event can now be awaited in your code if you use the method `wait`:

```py
async def process_local_files():
    await local_files_ready.wait()
    ... # Process the files locally
```

The `await` only concludes once the event is set elsewhere by using the method `set`:

```py
async def download_files():
    ... # Download the files
    local_files_ready.set()
    ... # Keep doing other stuff
```

Like with any other synchronisation primitive, you have to be careful about deadlocks.
