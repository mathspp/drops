---
themes:
    - "standard library"
    - "`ast` (module)"
    - "abstract syntax trees"
    - "`ast.parse`"
---

(104)=
# 104 – AST parsing

The module `ast` has a function `parse` that you can use to parse code (in a string) into what’s called an AST.
An AST is an “Abstract Syntax Tree”, an intermediate representation of your code that Python operates on.

Studying the ASTs produced by the module `ast` can teach you a lot about the Python language.
For example, by using `ast.parse` you can find out that the keyword `elif` is just syntactic sugar for a sequence of `else: if ...:` at the language level:

```py
import ast

code = """\
if a:
    pass
else:         # <--
    if b:     # <--
        pass
    else:
        pass
"""

print(ast.dump(
    ast.parse(code),
    indent=2,
))
```
```
Module(
  body=[
    If(
      test=Name(id='a', ctx=Load()),
      body=[
        Pass()],
      orelse=[                            <--
        If(                               <--
          test=Name(id='b', ctx=Load()),
          body=[
            Pass()],
          orelse=[
            Pass()])])])
```

This structure is **identical** to the one you get if you use `elif` instead of `else: if ...:`:

```py
import ast

code = """\
if a:
    pass
elif b:   # <--
    pass
else:
    pass
"""

print(ast.dump(
    ast.parse(code),
    indent=2,
))  # Exact same output.
```
