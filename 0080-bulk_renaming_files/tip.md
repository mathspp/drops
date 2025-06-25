---
themes:
    - "filesystem"
    - "`pathlib`"
    - "`pathlib.PurePath.with_stem`"
    - "`pathlib.Path.rename`"
    - "`pathlib.Path.iterdir`"
    - "`enumerate`"
---

## 80 – Bulk renaming files

To change the name of a file while preserving its extension you can use the method `pathlib.PurePath.with_stem`.
Note that this creates a new path object and doesn't do any file renaming automatically.
That is why the method `with_stem` is defined in `PurePath`, although it is also available from `Path`.

If you pair `with_stem` with `rename`, you can easily bulk-rename files in a folder.

Suppose the folder `reports` contains multiple reports in different formats, like PDF files, Excel files, and the occasional screenshot(!).
To rename all files, you could write something like

```py
from pathlib import Path

report_folder = Path("reports")  # PDFs, Excel files, ...

for idx, report in enumerate(report_folder.iterdir(), start=1):
    report.rename(report_pdf.with_stem(f"report{idx:03}"))

# Produces:
# reports/report001.pdf
# reports/report002.xlsx
# ...
```

Further reading:

 - [Module `pathlib` overview](https://mathspp.com/blog/module-pathlib-overview).
