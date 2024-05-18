#!/bin/bash

# Description: sums the reproduction time of all .mp4 videos under

sum() { paste -sd+ /dev/stdin | bc; }
seconds_format() { date -d@"$(</dev/stdin)" -u +%H:%M:%S; }

find . -xdev -name '*.mp4' -or -name '*.mp3' |
	while read -r video; do
		ffprobe -v quiet -show_format -hide_banner -print_format json -i "${video}"
	done | jq -r '.format.duration' | sum | seconds_format
