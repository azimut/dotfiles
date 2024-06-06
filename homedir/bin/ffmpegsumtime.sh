#!/bin/bash

# Description: sums up the reproduction time of all media under CWD

find . -regextype egrep -iregex '.*(mp4|mp3|webm)' |
	while read -r video; do
		ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "${video}"
	done |
	awk '{ t+=$1; printf("\033[10D%s", strftime("%H:%M:%S", t, 1)); } END { print "" }'
