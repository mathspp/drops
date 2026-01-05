---
themes:
    - "file I/O"
    ---

## 86 – File modes

There are 16 different file modes.
The four base modes are

 1. `r` for reading;
 2. `w` for writing;
 3. `a` for appending; and
 4. `x` for exclusive creation and writing.

The mode `x` is like `w`, but fails if the file already exists.
In other words, it ensures you're creating a new file.

The table below encodes the properties of each mode:

| Mode | `r` | `w` | `a` | `x` |
| - | - | - | - | - |
| allows read | x | | | |
| allows write | | x | x | x |
| must exist | x | | | |
| must not exist | | | | x |
| positioned at start | x | x | | x |
| positioned at end | | | x | |
| always writes to end | | | x | |

These four base modes operate on files in text mode, by default, which is the same as appending a `t` to each mode.
For example, the modes `r` and `rt` are the same.
Instead, you can append a `b` to open the files in binary mode.

Finally, you can also append a `+` to any mode to enable writing and reading at the same time, although this is uncommon because it can be quite confusing.

Further reading:

 - [File modes in Python](https://www.pythonmorsels.com/file-modes-in-python/).
