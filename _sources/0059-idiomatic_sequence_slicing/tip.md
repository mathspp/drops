---
themes:
    - "sequences"
    - "slicing"
    - "`reversed`"
---

(59)=
# 59 – Idiomatic sequence slicing

There are five slicing patterns that are fairly common and that have simple interpretations, and that's what an idiom is: a piece of code that you recognise for its meaning as a whole.

You should be able to interpret these five slicing idioms automatically without having to think:

 1. `[:n]` – first `n` chars
 2. `[n:]` – after first `n` chars
 3. `[:-n]` – without last `n` chars
 4. `[-n:]` – last `n` chars
 5. `[::-1]` – reversed (but the built-in `reversed` is usually preferred)

```py
string = "Slicing is easy!"

print(string[:4])  # Slic
print(string[4:])  # ing is easy!

print(string[:-4])  # Slicing is e
print(string[-4:])  # asy!

print(string[::-1])  # !ysae si gnicilS
```

Further reading:

 - [Idiomatic sequence slicing blog article](https://mathspp.com/blog/pydonts/idiomatic-sequence-slicing).
