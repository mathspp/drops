---
themes:
    - "readability"
    - "generators"
---

(192)=
# 192 – Break from nested loops

Breaking out of nested `for` loops requires auxiliary variables and conditional statements:

```py
done = False
for n in range(1, len(switches) + 1):
    for group in combinations(switches, n):
        state = simplify(group)
        if state == target:
            print("found!")
            done = True
            break
    if done:
        break
```

You need to use the Boolean flag `done` and an extra `if done` statement to be able to break out of the two loops once you find the value of `state` for which `state == target`.

To improve this code, you can refactor the looping logic into a generator:

```py
def groups_of_switches(switches):
    for n in range(1, len(switches) + 1):
        for group in combinations(switches, n):
            yield group
```

The generator should contain only the loops and no other logic.
By extracting the loops into a generator, you can refactor the original code so it's flatter:

```py
for group in groups_of_switches(switches):
    state = simplify(group)
    if state == target:
        print("found!")
        break
```

The flatter code is easier to reason about and it's easier to break out of this loop because it's no longer nested.
