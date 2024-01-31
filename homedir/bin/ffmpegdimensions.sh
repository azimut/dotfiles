#!/bin/bash

# Description: show dimensions of all .mp4 videos under

find . -name '*.mp4' | while read -r video; do
	ffprobe -v quiet -show_streams -show_format -hide_banner -print_format json -i "${video}" |
		jq -r '"\(.streams[0].width)x\(.streams[0].height) - \(.format.filename)"'
done
