#!/usr/bin/env python

import sys
from bs4 import BeautifulSoup
from urllib.parse import urlparse, urldefrag
from urllib.request import urlopen

def usage():
    print("List external links in an url.")
    print("Usage:")
    print(f"\t{sys.argv[0]} URL")


def main():
    html = urlopen(sys.argv[1]).read()
    soup = BeautifulSoup(html, 'html.parser')
    ulinks = set()

    for a in soup.find_all('a'):
        href = a.get('href')
        if href and urlparse(href).scheme:
            url, _ = urldefrag(href)
            ulinks.add(url)

    for link in sorted(ulinks,key=lambda x: urlparse(x).netloc):
        print(link)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        usage()
        sys.exit(1)
    main()
