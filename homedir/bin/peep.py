#!/usr/bin/env python3

import tty, termios, sys
import os
import re
from dataclasses import dataclass


@dataclass
class Window:
    id: int
    width: int
    height: int


def make_root():
    xrandr = os.popen("xrandr").read()
    dimensions = re.search(r'current (\d+) x (\d+)', xrandr)
    if dimensions:
        width, height = dimensions.groups()
        return Window(0, int(width), int(height))

def search(needle, hay):
    proc = os.popen(f"xdotool search --{hay} '{needle}'")
    output = proc.read()
    if not proc.close():
        return int(output.strip())

def search_name(needle): return search(needle, "name")
def search_class(needle): return search(needle, "class")

def make_target():
    winid = search_class("mpv") or search_name("picture-in-picture")
    if winid:
        proc = os.popen(f"xdotool getwindowgeometry {winid}")
        output = proc.read()
        if not proc.close():
            dimensions = re.search(r'(\d+)x(\d+)', output)
            if dimensions:
                width, height = dimensions.groups()
                return Window(winid, int(width), int(height))


def getchar():
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    try:
        tty.setraw(sys.stdin.fileno())
        ch = sys.stdin.read(1)
    finally:
        termios.tcsetattr(fd,termios.TCSADRAIN, old_settings)
    return ch


def main():
    while True:
        ch = getchar()
        print(ch)

if __name__ == '__main__':
    main()
