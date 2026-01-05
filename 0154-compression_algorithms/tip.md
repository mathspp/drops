---
themes:
    - "standard library"
    - "`compression` (module)"
    - "3.14 (new in Python 3.14)"
---

## 154 – Compression algorithms

Python 3.14 introduced a new module `compression` that provides a unified interface to access the five compression algorithms that Python supports:

 - `bz2`
 - `gzip`
 - `lzma`
 - `zlib`
 - `zstd` (new in Python 3.14)

Here's an example usage of `zstd` to compress a sequence of bytes:

```py
from compression import zstd

data = "3.141592653589793".encode() * 20
compressed = zstd.compress(data)
ratio = len(compressed) / len(data)
print(ratio)  # 0.1  # <- 10 times smaller!
```

The algorithms `bz2`, `gzip`, `lzma`, and `zlib`, were already standalone modules in Python 3.13 and earlier, so they continue to be so, but you can also access them through the unified interface of the module `compress`.

Further reading:

 - [Module `compression` overview](https://mathspp.com/blog/module-compression-overview)
