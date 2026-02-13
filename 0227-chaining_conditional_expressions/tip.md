---
themes:
    - ""
---

(227)=
# 227 – Chaining conditional expressions

To read two or more chained conditional expressions, start from the left.
The value that you encounter first is the one that has the highest precedence and it is used if the condition that follows evaluates to truthy.
If it evaluates to falsy, you continue reading to the right of the `else`.

Here is an example with 3 chained conditional expressions:

```py
age = int(input("What's your age? >> "))
# ?!
stage = "baby" if age <= 2 else "kid" if age <= 12 else "teen" if age <= 19 else "adult"
```

To read this, break the conditional expressions up:

```py
stage = (                     # 1
    "baby" if age <= 2 else   # 2
    "kid" if age <= 12 else   # 3
    "teen" if age <= 19 else  # 4
    "adult"                   # 5
)
```

Line by line, this reads

1. Set `stage` to
2. `"baby"` if the age is 2 or less, otherwise [set `stage` to]
3. `"kid"` if the age is 12 or less, otherwise [set `stage` to]
4. `"teen"` if the age is 19 or less, otherwise [set `stage` to]
5. `"adult"`.

If you chain 3 or more conditional expressions, Guido will find you and scold you.
I got away with just a warning for this one because I told Guido this was for educational purposes.
