#!/bin/bash

set -euo pipefail

# Description: show dimensions of all .mp4 videos under

getdimensions() {
	video="$1"
	dimensions="$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "${video}")"
	printf '%5dx%-4d\t'"'"'%s'"'"'\n' \
		"${dimensions%x*}" \
		"${dimensions#*x}" \
		"${video#*/}"
}
export -f getdimensions

find . -name '*.mp4' -print0 | sort -zn |
	xargs -I{} -n1 -0 -P2 -r \
		bash -c 'getdimensions "{}"'
