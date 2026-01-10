---
themes:
    - "strings"
    - "casing"
    - "`str.title`"
    - "text processing"
---

(172)=
# 172 – Title case

Use the string method `title` to change a string's casing to title case:

```py
print("star wars: the empire strikes back".title())
# Star Wars: The Empire Strikes Back
```

Title case will modify the case of each word so that its first letter is uppercase and all other letters are lowercase.
For some reason, I always think that `title` will only make sure the first letter of each word is uppercase, but it will actively lowercase letters that are not at the start of a word:

```py
print("CrAzY CAsInG".title())
# Crazy Casing
```

A “word” is a sequence of alphabetical characters, so you can have numbers of punctuation between the letters that `title` will still uppercase those as separate words:

```py
print("1word2words3words".title())
# 1Word2Words3Words
```
