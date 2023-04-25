#!/bin/bash
#
# Description:
#   used to reduce the size of a bunch of videos
#   while keeping their directory structure
#

set -euo pipefail

[[ $# -eq 0 ]] && {
	echo "ERROR: missing argument"
	echo "Usage:"
	echo "    $0 <SRCDIR> <VIDEO_FILTER>"
	exit 1
}

[[ ! -d ${1} ]] && {
	echo "ERROR: src does not exists"
	exit 1
}

SRC="$(realpath "${1}")"
FILTERS="${2:-scale=960:-1}"

info() {
	notify-send -t "$((2 * 1000))" -- \
		"$0" \
		"<span color='#57dafd' font='20px'>${1}</span>"
}

# Create DST directories
find "${SRC}" -type d | tail -n+2 |
	while read -r dir; do
		mkdir -vp ".${dir#${SRC}}"
	done

# Counters
total="$(find "${SRC}" -type f \( -iname \*.mp4 -o -iname \*.mkv \) | wc -l)"
i=0

# Convert videos
find "${SRC}" -type f \( -iname \*.mp4 -o -iname \*.mkv \) |
	while read -r srcfile; do
		dstfile=".${srcfile#${SRC}}"
		info "${i}/${total}"
		((++i))
		[[ -f ${dstfile} ]] && {
			echo "Skipping ${dstfile}..."
			continue
		}
		ffmpeg -hide_banner -i "${srcfile}" -ac 1 -vf "${FILTERS}" "${dstfile}" </dev/null
	done

info "done!"
