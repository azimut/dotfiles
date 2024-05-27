#!/bin/bash
#
# Description:
#   used to reduce the size of a bunch of videos
#   while keeping their directory structure
#

set -euo pipefail

info() {
	notify-send -t "$((5 * 1000))" -- \
		"$(basename $0)" \
		"<span color='#57dafd' font='20px'>${1}</span>"
}

usage() {
	echo "Usage:"
	echo "    $(basename $0) [-f VIDEO_FILTER] [-s TIME_SKIP] SRCDIR"
	exit 1
}

while getopts ":hs:f:" arg; do
	case $arg in
	h) usage ;;
	f) FILTERS="$OPTARG" ;;
	s) SKIP="$OPTARG" ;;
	*) usage ;;
	esac
done
shift $((OPTIND - 1))

SRC="$(realpath "${1}")"
FILTERS="${FILTERS:-scale=960:-1}"
SKIP="${SKIP:-00:00:00}"

[[ $# -ne 1 ]] && {
	echo "ERROR: missing argument"
	usage
}
[[ ! -d ${1} ]] && {
	echo "ERROR: src does not exists"
	usage
}

# Create DST directories
find "${SRC}" -mindepth 1 -type d |
	while read -r dir; do
		mkdir -vp ".${dir#"${SRC}"}"
	done

# Copy non-video files
find "${SRC}" -type f -not \( -iname \*.mp4 -o -iname \*.mkv \) |
	while read -r srcfile; do
		dstfile=".${srcfile#"${SRC}"}"
		[[ -f ${dstfile} ]] && {
			continue
		}
		cp "${srcfile}" "${dstfile}"
	done

# Counter
total="$(find "${SRC}" -type f \( -iname \*.mp4 -o -iname \*.mkv \) | wc -l)"
printf '\nNumber of file to convert: %d\n\n' "${total}"

# Convert videos
before="$(du -sh "${SRC}" | cut -f1)"
i=0
find "${SRC}" -type f \( -iname \*.mp4 -o -iname \*.mkv \) | sort |
	while read -r srcfile; do
		dstfile=".${srcfile#"${SRC}"}"
		((++i))
		info "${i} of ${total}"
		[[ -f ${dstfile} ]] && {
			continue
		}
		ffbar -ss "${SKIP}" -i "${srcfile}" -ac 1 -vf "${FILTERS}" "${dstfile}" || {
			rm -vf "${dstfile}"
			exit 1
		}
	done

echo
echo "Before: ${before}"
echo "After:  $(du -sh . | cut -f1)"
echo
info "done!"
