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
    for procfile in proc.open_files():
        if procfile.path.endswith('.pdf'):
            return procfile.path
    sys.exit("ERROR: pdf not found in pid!")


def save_to_disk(srcfile):
    """Copy file to ~/Downloads/."""
    home = os.path.expanduser("~")
    filename = os.path.basename(srcfile)
    dstfile = f"{home}/Downloads/{filename}"

    if os.path.exists(dstfile):
        sys.exit(f"ERROR: destination file ({filename}) already exists")

    try:
        shutil.copyfile(srcfile, dstfile)
        print(dstfile)
    except OSError:
        os.remove(dstfile)
        raise


if __name__ == '__main__':
    proc = process_of_pdfviewer()
    pdf = path_of_pdf(proc)
    save_to_disk(pdf)
