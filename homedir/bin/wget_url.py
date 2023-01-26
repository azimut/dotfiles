#!/usr/bin/env python3.8

import sys
import os.path
from time import time
from urllib.parse import urlparse
from urllib.request import urlretrieve


def progress_hook(count, block_size, total_size):
    global start_time
    if count == 0:
        start_time = time()
        return
    duration = time() - start_time
    progress_size = int(count * block_size)
    speed = int(progress_size / (1024*duration))
    percent = int(count * block_size * 100 / total_size)
    sys.stdout.write("\r...%d%%, %d MB, %d KB/s, %d seconds passed" %
                     (percent, progress_size / (1024*1024), speed, duration))
    sys.stdout.flush()


def download(url):
    urlpath = urlparse(url).path
    _, filename = os.path.split(urlpath)
    urlretrieve(url, filename, progress_hook)
    print("\ndone!", filename)


try:
    url = sys.argv[1]
except IndexError:
    raise SystemExit("Usage: %s <url>" % sys.argv[0])

if __name__ == '__main__':
    download(url)
