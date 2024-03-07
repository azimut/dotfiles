#!/bin/bash

err() { echo "ERROR: $*" >&2; }
usage() {
	echo "Removes audio track from provided input file."
	echo -e "\t$ $(basename $0) <VIDEO>"
}

set -euo pipefail

(($# != 1)) && err "missing argument" && usage && exit 1
[[ ! -s $1 ]] && err "provided file does not exists!" && usage && exit 1

filename="$1"

ffmpeg -i "${filename}" -map 0 -map -0:a -c copy tmp.mp4
mv tmp.mp4 "${filename}"
