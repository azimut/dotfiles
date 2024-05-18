#!/bin/bash

# Description: sums the reproduction time of all .mp4 videos under

find . -xdev -name '*.mp4' -or -name '*.mp3' |
	while read -r video; do
		ffprobe -v quiet -show_format -hide_banner -print_format json -i "${video}"
	done | jq -sr 'map(.format.duration|tonumber) | add | strftime("%H:%M:%S")'
