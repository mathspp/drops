---
themes:
    - "API"
    - "standard library"
    - "`itertools`"
    - "`itertools.batched`"
    - "performance optimisation"
---

## 47 – Batching API calls

Since Python 3.12 that the module `itertools` has `batched`: it accepts an iterable and it produces batches of values from that iterable.

You can use this for all sorts of batch processing.
For example, you can use `batched` to batch API calls.

Many APIs have ways to handle one request or multiple similar requests at the same time.
For example, my newsletter subscriber has an API endpoint that allows me to add tags to a subscriber.
However, there is a similar endpoint that allows me to do the same thing to multiple subscribers at the same time.

The second option means I hit the API fewer times, which makes my code run faster.
There's less back-and-forth over the network.

Here's the pseudo-code for comparison.
First, handling a single user per request:

```py
users_to_update = [...]
for user in users_to_update:
    api.add_tag(user, "some tag")
```

Now, the pseudo-code for the batch updates:

```py
from itertools import batched

users_to_update = [...]
# The API can't handle more than 50 users at a time.
for user_batch in batched(users_to_update, 50):  # <--
    api.add_tag_to_users(user_batch, "some tag")
```
