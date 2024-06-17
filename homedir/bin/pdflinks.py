#!/usr/bin/env python3

import pymupdf
import sys

def usage():
    print("Usage:")
    print(f"\t{sys.argv[0]} PDF_FILE")


def main():
    doc = pymupdf.open(sys.argv[1])
    for page in doc:
        for link in page.get_links():
            match link['kind']:
                case 2:
                    print(link['uri'])
                case 3:
                    print(link['file'])
                case 1|4|5:
                    continue
                case _:
                    print("?????", link)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        usage()
        sys.exit(1)
    main()
