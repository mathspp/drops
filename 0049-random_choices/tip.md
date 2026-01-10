---
themes:
    - "`random` (module)"
    - "`random.sample`"
    - "`random.choices`"
    - "standard library"
---

(49)=
# 49 – Random choices

Predictability is usually helpful, but it can also be quite boring.
On the other hand, randomness isn't always helpful, but sometimes it's the only way to get something done.

(As a real-world example, the generic profile pictures in [the testimonials page on my website](https://mathspp.com/testimonials) have random patterns and random colours.)

To pick a random value from a list, you have two alternatives:

 - Use `random.choices` if you want to pick values with replacement (values can be repeated):

```py
import random

coin_sides = ["heads", "tails"]

print(random.choices(coin_sides, k=4))
# ['heads', 'tails', 'tails', 'tails']
```

 - Use `random.sample` if you want to pick values without replacement (values cannot be repeated):

```py
import random

colours = ["red", "green", "blue",
           "black", "white"]
print(random.sample(colours, k=3))
# ['black', 'green', 'blue']
```

For either, set `k` to specify how many values you want to draw from the given list.

**Note**: for security-sensitive randomness, use the module `secrets`; not the module `random`.
