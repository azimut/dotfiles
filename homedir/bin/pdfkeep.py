#!/usr/bin/env python3
"""copies the currently opened pdf (by evince or mupdf) into localdisk."""

import os
import shutil
import sys
import psutil


def process_of_pdfviewer():
    """Return the Process of a pdf viewer."""
    for p in psutil.process_iter(['pid', 'name']):
        if p.info['name'] in ['evince', 'mupdf']:
            return p
    sys.exit("ERROR: pdf viewer not found!")


def path_of_pdf(proc):
    """Return the path of the opened .pdf in the process."""
    for f in proc.open_files():
        if f.path.endswith('.pdf'):
            return f.path
    sys.exit("ERROR: pdf not found in pid!")


def save_to_disk(srcpath):
    """Copy file to CWD."""
    filename = os.path.basename(srcpath)
    dstpath = f"{os.curdir}/{filename}"

    try:
        shutil.copyfile(srcpath, dstpath)
        print(dstpath)
    except OSError:
        os.remove(dstpath)
        raise


if __name__ == '__main__':
    proc = process_of_pdfviewer()
    pdf = path_of_pdf(proc)
    save_to_disk(pdf)
