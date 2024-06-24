#!/usr/bin/env python3
"""Downloads url of a file, removes url parameters."""

import re
import sys
import os.path
from time import time
from urllib.parse import urlparse
from urllib.request import urlretrieve


def progress_hook(count, block_size, total_size):
    """Show an animated progress bar."""
    global start_time
    if count == 0:
        start_time = time()
        return
    seconds = time() - start_time
    progress_size = int(count * block_size)
    progress_mb = progress_size / (1024*1024)
    speed = int(progress_size / (1024*seconds))
    percent = int(count * block_size * 100 / total_size)
    msg = f"\r {percent}%%, {progress_mb} MB, {speed} KB/s, {seconds}s passed"
    sys.stdout.write(msg)
    sys.stdout.flush()


def download(url, filename):
    """Download the url provided of a file into disk."""
    final_url = re.sub(r"&bytestart=[0-9]&byteend=[0-9]+", "", url)
    urlretrieve(final_url, filename, progress_hook)
    print("\ndone!", filename)


try:
    url = sys.argv[1]
except IndexError:
    raise SystemExit(f"Usage: {sys.argv[0]} [URL]...")

if __name__ == '__main__':
    for url in sys.argv[1:]:
        _, filename = os.path.split(urlparse(url).path)
        if os.path.exists(filename):
            raise SystemExit(f"file {filename} already exists!")
        download(url, filename)
