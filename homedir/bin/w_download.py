#!/usr/bin/env python3

import sys
import json
import csv
import os
import urllib.request


def extract_row(file, domain):
    return ["https://"+domain+file['thumb'],
            "https://"+domain+file['path'],
            file['originalName']]


def download(url, filename):
    req = urllib.request.Request(url, data=None, headers={
        'User-Agent': os.environ['UA']
    })
    image = urllib.request.urlopen(req)
    with open(filename, 'wb') as f:
        f.write(image.read())
    print("downloaded " + filename)


def main(url):
    domain = urllib.parse.urlparse(url).netloc
    entries = []
    req = urllib.request.Request(url, data=None, headers={
        'User-Agent': os.environ['UA']
    })
    with urllib.request.urlopen(req) as raw_json:
        thread = json.load(raw_json)
        for file in thread['files']:
            entries.append(extract_row(file, domain))
        for post in thread['posts']:
            for file in post['files']:
                entries.append(extract_row(file, domain))

    for entry in entries:
        thumb_url = entry[0]
        file = "thumbs/"+entry[2]
        if os.path.isfile(file):
            print("already exists "+file)
            continue
        try:
            download(thumb_url, file)
        except urllib.error.HTTPError:
            print("error downloading "+file)
            pass

    with open('do.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        writer.writerows(entries)


if __name__ == '__main__':
    try:
        url = sys.argv[1]
    except IndexError:
        raise SystemExit("missing argument!\nUsage: %s <url>" % sys.argv[0])

    os.makedirs("thumbs", exist_ok=True)
    main(url)
