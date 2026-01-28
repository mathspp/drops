---
themes:
    - "`heapq`"
    - "data structures"
    - "priority queues"
    - "`dataclasses` (module)"
    - "`dataclasses.dataclass`"
---

(181)=
# 181 – Priority queues

The module `heapq` provides an interface to work with priority queues, where elements added to the queue have an associated priority and they are popped according to that priority.

Suppose you have a data class `Order` that represents orders at a pizza restaurant:

```py
from dataclasses import dataclass

@dataclass(order=True)
class Order:
    priority: int
    order: str
```

The integer `priority` represents the order priority and the string `order` represents the food items ordered.
Instances of the data class `Order` are orderable by the attribute `priority`, with `order` being used as a tie-breaker, thanks to the parameter `order=True` in the call to `dataclass`.

By using a priority queue, you can keep track of all orders and have them sorted by priority automatically:

```py
import heapq

orders = []
heapq.heappush(orders, Order(5, "pizza"))
heapq.heappush(orders, Order(1, "2 large pizzas"))
heapq.heappush(orders, Order(10, "dessert"))

while orders:
    print(heapq.heappop(orders))
```
```text
Order(priority=1, order='2 large pizzas')
Order(priority=5, order='pizza')
Order(priority=10, order='dessert')
```

Despite having been added _after_, the order for two large pizzas was popped _before_ the order for a single pizza.
