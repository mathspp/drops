---
themes:
    - "regex"
    - "`re`"
    - "backslash `\\`"
---

## 97 – Match word boundaries

The special character `\b` can be used to match word boundaries in regular expressions.
The special character `\B`, on the other hand, only matches inside words.

By combining `\b` and `\B` you can match prefixes, suffixes, standalone words, and more.

As an example, consider the sentence "watermelon is 92% water!" and three different patterns:

1. The pattern `r"water"` matches the five characteres "water" in sequence, so it would match the two occurrences of "water" in the sentence given.
2. The pattern `r"\bwater\b"` matches "water" as a standalone word, so it would only match the word at the end of the string.
3. The pattern `r"\bwater\B"` matches "water" as a prefix, so it would only match the string "water" that is a substring of the word "watermelon" at the beginning of the sentence.
