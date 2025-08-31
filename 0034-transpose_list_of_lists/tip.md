---
themes:
    - "built-ins"
    - "`zip`"
    - "splat operator `*`"
    - "asterisk `*`"
---

## 34 – Transpose a list of lists

The built-in `zip` can be used with the splat operator `*` to transpose a list of iterables.

For example, you can go from

```py
persons = [["Han", "Solo"], ["Obi-Wan", "Kenobi"], ["Darth", "Vader"]]
```

to

```py
firsts = ('Han', 'Obi-Wan', 'Darth')
lasts = ('Solo', 'Kenobi', 'Vader')
```

You just need a simple line of code:

```py
firsts, lasts = zip(*persons)
```

If you look closely, this is `zip` undoing what `zip` can do, since you can recreate `persons` by doing `zip(firsts, lasts)`:

```py
print(list(zip(firsts, lasts)))
# [('Han', 'Solo'), ('Obi-Wan', 'Kenobi'), ('Darth', 'Vader')]
```

The only thing to note is that `zip` produces tuples, so the original variable `persons` contained a list of lists and the output from the snippet above is a list of tuples.


Further reading:

 - [Article about `zip`](https://mathspp.com/blog/pydonts/zip-up)
