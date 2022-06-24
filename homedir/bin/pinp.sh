#!/bin/bash

# TODO: option to pick a corner
#       https://gist.github.com/andrewmcdonough/88246/81d540704fdd7b753083da7e5e718abc23b87467

set -exuo pipefail

mul() { echo "$(</dev/stdin) * ${1}" | bc -l; }
div() { echo "$(</dev/stdin) / ${1}" | bc -l; }
round() { printf "%.0f" "$(</dev/stdin)"; }

getTargetID() {
	xdotool search --class mpv || xdotool search --name picture-in-picture
}

getScreenDimensions() {
	xrandr | grep -o 'current [[:digit:]]* x [[:digit:]]*' | cut -f2,4 -d' '
}

getWindowDimensions() {
	local id="${1}"
	xdotool getwindowgeometry --shell "${id}" | grep -E 'WIDTH|HEIGHT' | cut -f2 -d= | xargs
}

MULTIPLIER="${1:-1}"
BAR_OFFSET=20

ID="$(getTargetID)"

read -r -a SCREEN_DIMENSIONS < <(getScreenDimensions)
read -r -a CURRENT_DIMENSIONS < <(getWindowDimensions ${ID})

TARGET_WIDTH="$(echo ${CURRENT_DIMENSIONS[0]} | mul ${MULTIPLIER} | round)"
TARGET_HEIGHT="$(echo ${CURRENT_DIMENSIONS[1]} | mul ${MULTIPLIER} | round)"

xdotool windowsize ${ID} "${TARGET_WIDTH}" "${TARGET_HEIGHT}"
xdotool windowmove ${ID} \
	$((SCREEN_DIMENSIONS[0] - TARGET_WIDTH)) \
	$((0 + BAR_OFFSET))
