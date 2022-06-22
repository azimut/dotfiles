#!/bin/bash

# TODO: option to pick a corner
#       https://gist.github.com/andrewmcdonough/88246/81d540704fdd7b753083da7e5e718abc23b87467

set -exuo pipefail

getID() {
	xdotool search --class mpv ||
		xdotool search --name picture-in-picture
}

getScreenDimensions() {
	xrandr |
		grep -o 'current [[:digit:]]* x [[:digit:]]*' |
		cut -f2,4 -d' '
}

getWindowWidth() {
	local id="${1}"
	xdotool getwindowgeometry --shell ${id} |
		grep WIDTH |
		cut -f2 -d'='
}

read -r -a SCREEN < <(getScreenDimensions)

MULTIPLIER="${1:-1}"
BAR_OFFSET=20

ID="$(getID)"

SCREEN_WIDTH="${SCREEN[0]}"
SCREEN_HEIGHT="${SCREEN[1]}"

TARGET_WIDTH=$((200 * MULTIPLIER))
TARGET_HEIGHT=$((100 * MULTIPLIER))

xdotool windowsize ${ID} "${TARGET_WIDTH}" "${TARGET_HEIGHT}"

EFFECTIVE_WIDTH="$(getWindowWidth ${ID})"

xdotool windowmove ${ID} \
	$((SCREEN_WIDTH - EFFECTIVE_WIDTH)) \
	$((0 + BAR_OFFSET))
