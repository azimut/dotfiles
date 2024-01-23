#!/bin/bash

# Description: sums the reproduction time of all .mp4 videos under

sum() { paste -sd+ /dev/stdin | bc; }
seconds_format() {
	local seconds
	seconds="$(</dev/stdin)"
	date -d@"${seconds}" -u +%H:%M:%S
}

find . -xdev -name '*.mp4' | while read -r video; do
	ffprobe -v quiet -show_streams -hide_banner -print_format json -i "${video}" |
		jq -r '.streams[0].duration'
done | sum | seconds_format
