---
themes:
    - "standard library"
    - "`compression` (module)"
    - "3.14 (new in Python 3.14)"
    - "`compression.zstd`"
    - "data processing"
    - "bytes"
---

## 200 – One-shot data compression

The module `compression`, new in Python 3.14, provides a convenient way to do one-shot data compression.
There are [5 different algorithms to choose from](#compression-algorithms), but you can default to the Zstd if you don't have any particular reason to pick one over another.

To compress data, make sure you're working with bytes and call the function `compress`:

```py
from compression import zstd

data = ("Hello, world!" * 1000).encode()

compressed = zstd.compress(data)
```

You can see this compresses the data to only occupy $0.2%$ of its original size:

```py
print(len(compressed))  # 31
print(len(compressed) / len(data))  # 0.0023846153846153848
```

You can decompress the data with the aptly-named function `decompress`:

```py
print(zstd.decompress(compressed) == data) # True
```

Further reading:

 - [Module `compression` overview](https://mathspp.com/blog/module-compression-overview)
