#!/bin/bash
set -exuo pipefail

N=5
INPUT="$1"
test -f "${INPUT}"

div() { echo "$(</dev/stdin) / ${1}" | bc -l ; }
round(){ printf "%.0f" "$(</dev/stdin)"; }
timestamp(){ date -u --date=@"${1}" +%H:%M:%S; }
seconds() {
    ffprobe -loglevel error -hide_banner -of csv=p=0 -show_entries format=duration "${1}"
}

output="$(basename "${INPUT}").mp3"
step="$(seconds "${INPUT}" | div ${N} | round)"

rm -f extract_tmp*jpg

for ((i = 0 ; i < N ; i++)); do
    ffmpeg -hide_banner -loglevel error \
           -ss "$(timestamp $(( step * i )))" \
           -i "${INPUT}" \
           -frames:v 1 \
           "extract_tmp${i}.jpg"
done

ffmpeg -hide_banner \
       -i "${INPUT}" \
       -i "$(ipickme -s 200 ./extract_tmp*jpg)" \
       -y \
       -ac 1 -c:v mjpeg -map 0:a -map 1:v \
       "${output}"

rm -f extract_tmp*jpg
