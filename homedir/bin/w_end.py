#!/usr/bin/env python3

import csv
import os
import urllib.request


def download(url, filename):
    req = urllib.request.Request(url, data=None, headers={
        'User-Agent': os.environ['UA']
    })
    image = urllib.request.urlopen(req)
    with open(filename, 'wb') as f:
        f.write(image.read())
    print("downloaded " + filename)


def load_csv():
    entries = {}
    with open('do.csv', newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=' ', quotechar='|')
        for entry in reader:
            entries[entry[2]] = entry[1]
    return entries


def main():
    os.makedirs("final", exist_ok=True)
    file2url = load_csv()
    for image in os.listdir("thumbs"):
        file = "final/"+image
        if os.path.isfile(file):
            print("already exists "+file)
            continue
        try:
            download(file2url[image], file)
        except urllib.error.HTTPError:
            print("skipping "+image)
            pass


if __name__ == '__main__':
    main()
