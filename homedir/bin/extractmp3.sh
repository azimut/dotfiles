#!/bin/bash
set -exuo pipefail

INPUT="$1"
test -f "${INPUT}"
output="$(basename "${INPUT}").mp3"

rm -f output.jpg
ffmpeg -hide_banner -y -i "${INPUT}" -frames:v 1 output.jpg
ffmpeg -hide_banner -i "${INPUT}" -i output.jpg -ac 1 -c:v mjpeg -map 0:a -map 1:v "${output}"
rm -f output.jpg
