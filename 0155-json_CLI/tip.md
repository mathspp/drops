---
themes:
    - "JSON"
    - "`json` (module)"
    - "data processing"
    - "CLI"
    - "standard library"
    - "3.14 (new in Python 3.14)"
---

## 155 – `json` CLI

The module `json` is your go-to tool when working with files or data in JSON format.
In Python 3.14, the module got a new CLI that allows you to validate and pretty-print JSON data directly from the command line.

For example, if the file `mydata.json` contains the following data:

```json
{
    "isActive": true,
    "balance": "$2,186.98",
    "age": 33
}
```

Then, the `json` CLI can be used to turn the JSON data into a more compact format by using its option `--compact` while also ordering keys:

```bash
$ python -m json mydata.json --compact --sort-keys
```

The output produced is the following:

```json
{"age":33,"balance":"$2,186.98","isActive":true}
```

The prefix `python -m json` is the command you use to run the CLI of the module `json`; `mydata.json` specifies the input file; `--compact` is a flag that suppresses all whitespace separation; and `--sort-keys` sorts keys in dictionaries alphabetically.

Run `python -m json --help` to see all the options and flags that the CLI supports.
