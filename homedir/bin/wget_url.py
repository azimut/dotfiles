#!/usr/bin/env python3.8

import sys
import os.path
from urllib.parse import urlparse
from urllib.request import urlretrieve


def download(url):
    urlpath = urlparse(url).path
    _, filename = os.path.split(urlpath)
    urlretrieve(url, filename)


try:
    url = sys.argv[1]
except IndexError:
    raise SystemExit("Usage: %s <url>" % sys.argv[0])

if __name__ == '__main__':
    download(url)
