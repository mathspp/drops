# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "pypdf",
# ]
# ///
import sys

from pypdf import PdfWriter


first, second, save_to = sys.argv[1:]


merger = PdfWriter()
merger.append(first)
merger.append(second)

merger.write(save_to)
merger.close()
