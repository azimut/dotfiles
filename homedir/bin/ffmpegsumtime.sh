#!/bin/bash

# Description: sums the reproduction time of all .mp4 videos under

find . -name '*.mp4' -or -name '*.mp3' |
	while read -r video; do
		ffprobe -v error -show_entries format=duration -of default=nokey=1 "${video}"
	done |
	awk '{ t+=$1; printf("\033[10D"); printf("%s", strftime("%H:%M:%S", t, 1)); } END { print "" }'
