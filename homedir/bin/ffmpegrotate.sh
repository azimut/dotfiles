#!/bin/bash

# Reference: https://gist.github.com/cmlewis/f950d876171a11703f89

set -euo pipefail

err() {
	echo "ERROR: $1" >&2
	exit 1
}
usage() {
	echo -e "ERROR: $1\nUSAGE:\n\t$(basename $0) VIDEO" >&2
	exit 1
}
round() { awk '{ print(int($0)) }'; }
timestamp() { date -u --date=@"${1}" +%H:%M:%S; }
seconds() {
	ffprobe -loglevel error -hide_banner -of csv=p=0 -show_entries format=duration "$1" | round
}

[[ $# -ne 1 ]] && usage "missing argument"
[[ ! -f $1 ]] && usage "file does not exists"

video="$1"
declare -A rotations=(
	[0]="copy"
	[90]="transpose=1"
	[180]="transpose=2,transpose=2"
	[270]="transpose=2"
)

# 0: generate rotated thumbnails
seconds=$((RANDOM % $(seconds "${video}") + 1))
for rot in "${!rotations[@]}"; do
	ffmpeg -y -hide_banner -loglevel error \
		-ss "$(timestamp ${seconds})" \
		-i "${video}" \
		-vf "${rotations[$rot]}" \
		-frames:v 1 \
		"extract_tmp_${rot}.jpg"
done

# 1: pick rotation
rot=""
img="$(ipickme extract_tmp*.jpg)"
case "${img}" in
*_0.jpg) err "we choose to not rotating anything..." ;;
*jpg)
	rot="${img##*tmp_}"
	rot="${rot%.jpg}"
	;;
*) err "nothing picked..." ;;
esac
rm -f extract_tmp*.jpg

# 2: generate video
filename="$(basename "${video}")"
extension="${filename##*.}"
filename="${filename%.*}"
output_file="${filename}_${rot}.${extension}"
ffmpeg -y -hide_banner -loglevel error \
	-i "${video}" \
	-metadata:s:v rotate="-${rot}" \
	-codec copy \
	"${output_file}"

rm -vf "${video}"
echo "new \'${output_file}\'"
