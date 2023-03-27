#!/bin/bash
#
# Description:
#   used to reduce the size of a bunch of videos
#   while keeping their directory structure
#
# TODO: assumes 16:9, horizontal

set -euo pipefail

[[ $# -ne 1 ]] && {
	echo "ERROR: missing argument"
	echo "Usage:"
	echo "    $0 <SRCDIR>"
	exit 1
}

[[ ! -d ${1} ]] && {
	echo "ERROR: src does not exists"
	exit 1
}

SRC="$(realpath "${1}")"

# Create DST directories
find "${SRC}" -type d | tail -n+2 |
	while read -r dir; do
		mkdir -vp ".${dir#${SRC}}"
	done

# Convert videos
find "${SRC}" -type f \( -iname \*.mp4 -o -iname \*.mkv \) |
	while read -r srcfile; do
		dstfile=".${srcfile#${SRC}}"
		[[ -f ${dstfile} ]] && {
			echo "Skipping ${dstfile}..."
			continue
		}
		ffmpeg -i "${srcfile}" -ac 1 -vf scale=960:-1 "${dstfile}" </dev/null
	done
