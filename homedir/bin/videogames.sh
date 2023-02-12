#!/bin/bash

SCRIPTS=(
	"${HOME}/.config/mpv/ignore.lua"
)

SCRIPT_OPTS=(
	'autocrop-auto=no'
	'autocrop-suppress_osd=yes'
)

join() {
	local IFS="$1"
	shift
	echo "$*"
}

find ~/disk2/zone2 ~/disk2/.zone -type f -size +1M -print0 | shuf -z | xargs -0 mpv \
	--scripts="$(join ':' "${SCRIPTS[@]}")" \
	--script-opts="$(join ',' "${SCRIPT_OPTS[@]}")" \
	--mute=yes \
	--loop-file=yes \
	--loop-playlist=yes \
	--no-keepaspect-window
