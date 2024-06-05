#!/bin/bash

set -euo pipefail

usage() {
	echo "Takes a screenshoot of the given video, at the given time."
	echo -e "Usage:\n\t$(basename $0) URL TIMESTAMP"
	echo -e "\t$(basename $0) 'https://www.youtube.com/watch?v=dQw4w9WgXcQ' 00:01:00"
}
err() { echo -e "ERROR: $*\n" >&2; }

(($# != 2)) && err "wrong number of arguments" && usage && exit 1
((${#2} < 8)) && err "invalid timestamp" && usage && exit 1

video_url="$1"
timestamp="$2"

ffmpeg -hide_banner -ss "${timestamp}" \
	-i "$(youtube-dl -f bestvideo --get-url "${video_url}")" \
	-vframes 1 \
	-q:v 2 \
	-y \
	"screenshoot_${EPOCHSECONDS}.png"
