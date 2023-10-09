#!/bin/bash

# Reference: https://gist.github.com/cmlewis/f950d876171a11703f89

set -euo pipefail

ferror() {
	echo "ERROR: $1" >&2
	exit 1
}

[[ $# -ne 2 ]] && {
	ferror "needs two params, 1st is file, 2nd rotation in degrees"
	return 1
}

[[ ! -f $1 ]] && {
	ferror "file does not exists"
	return 1
}

video="$1"
filename="$(basename "${video}")"
extension="${filename##*.}"
filename="${filename%.*}"
opts=""

case $2 in
90) opts="transpose=1" ;;
90f) opts="transpose=3" ;;
180) opts="transpose=2,transpose=2" ;;
270) opts="transpose=2" ;;
270f) opts="transpose=0" ;;
*) ferror "should have been a value among 90, 180 or 270" ;;
esac

ffmpeg -hide_banner \
	-i "${video}" \
	-vf "${opts}" \
	-codec:a copy \
	"${filename}_$2.${extension}"
