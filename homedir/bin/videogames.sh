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

mpv --scripts="$(join ':' "${SCRIPTS[@]}")" \
	--script-opts="$(join ',' "${SCRIPT_OPTS[@]}")" \
	--mute=yes \
	--loop-file=yes \
	--loop-playlist=yes \
	--no-keepaspect-window \
	--shuffle "${@}" \
	.
