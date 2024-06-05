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
	echo "    $(basename $0) [-f VIDEO_FILTER] [-s TIME_SKIP] [-r FPS] [-t TRIM ] SRCDIR"
	exit 1
}

getduration() { ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1" | cut -f1 -d'.'; } # TODO: handle float
time2sec() { date -d "1970-01-01T$* UTC" '+%s'; }
sec2time() { date -d "@$*" -u '+%H:%M:%S'; }

while getopts ":hs:f:r:t:" arg; do
	case $arg in
	h) usage ;;
	f) FILTERS="$OPTARG" ;;
	s) SKIP="$OPTARG" ;;
	r) RATE="$OPTARG" ;;
	t) TRIM="$OPTARG" ;;
	*) usage ;;
	esac
done
shift $((OPTIND - 1))

[[ $# -ne 1 ]] && {
	echo "ERROR: missing argument"
	usage
}
[[ ! -d ${1} ]] && {
	echo "ERROR: src does not exists"
	usage
}

SRC="$(realpath "${1}")"
FILTERS="${FILTERS:-scale=960:-1}"
SKIP="${SKIP:-00:00:00}"
RATE="${RATE:-30}"

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
		info "$((total - i++)) remaining..."
		[[ -f ${dstfile} ]] && {
			continue
		}
		if [[ -n $TRIM ]]; then
			length="$(sec2time $(($(getduration "${srcfile}") - $(time2sec "${SKIP}") - $(time2sec "${TRIM}"))))"
			ffbar -ss "${SKIP}" -t "${length}" -i "${srcfile}" -r "${RATE}" -ac 1 -ar 22050 -vf "${FILTERS}" "${dstfile}" || {
				rm -vf "${dstfile}"
				exit 1
			}
		else
			ffbar -ss "${SKIP}" -i "${srcfile}" -r "${RATE}" -ac 1 -ar 22050 -vf "${FILTERS}" "${dstfile}" || {
				rm -vf "${dstfile}"
				exit 1
			}
		fi

	done

echo
echo "Before: ${before}"
echo "After:  $(du -sh . | cut -f1)"
echo
info "done!"
