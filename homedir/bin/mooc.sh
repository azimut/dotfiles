#!/bin/bash

# Description: Downloads a playlist of a MOOC
# - With subs
# - With low video quality for space
# - With the best audio (TODO: converted to mono)
# - Name numbered

set -exuo pipefail

URL="${1}"
LESS="${2:-720}"
START="${3-1}"

echo -n "${URL}" >url

yt-dlp \
	--playlist-start="${START}" \
	--output '%(playlist_index)03d-%(title)s[%(id)s].%(ext)s' \
	--format 'bestvideo[height<'"${LESS}"']+bestaudio' \
	--write-subs --sub-langs 'en.*,es.*' \
	--continue \
	"${URL}"
