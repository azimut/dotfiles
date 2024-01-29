#!/usr/bin/env python3
"""copies the currently opened pdf (by evince or mupdf) into CWD."""

import os
import shutil
import sys
import psutil


PDF_VIEWERS = ['evince', 'mupdf']


def is_path_mounted(srcpath):
    """Check if provided path is on a mounted device."""
    srcdir = os.path.dirname(srcpath)
    homedir = os.getenv('HOME')
    return os.statvfs(srcdir).f_bfree != os.statvfs(homedir).f_bfree


def path_of_opened_pdf():
    """Return path of pdf on a pdf viewer."""
    for p in psutil.process_iter(['pid', 'name']):
        if p.info['name'] in PDF_VIEWERS:
            for f in p.open_files():
                if (f.path.endswith('.pdf') or f.path.endswith('.epub')) \
                   and is_path_mounted(f.path):
                    return f.path
    sys.exit("ERROR: opened pdf not found!")


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
    pdf = path_of_opened_pdf()
    save_to_disk(pdf)
