#!/bin/bash

# TODO: option to pick a corner
#       https://gist.github.com/andrewmcdonough/88246/81d540704fdd7b753083da7e5e718abc23b87467

set -euo pipefail

imul() { awk -v a="$1" -v b="$2" 'BEGIN { print(int(a*b)) }'; }

getWindowID() {
	xdotool search --name 'picture-in-picture' ||
		xdotool search --onlyvisible --class 'mpv'
}

getScreenDimensions() { xrandr | awk '/current/{ print($8, int($10)) }'; }
getWindowDimensions() { xdotool getwindowgeometry "$1" | awk '/Geometry/{ gsub("x"," "); print($2,$3) }'; }

MULTIPLIER="${1:-1}"
BAR_OFFSET="${2:-20}"

ID="$(getWindowID)"

read -r -a SCREEN_DIMENSIONS < <(getScreenDimensions)
read -r -a WINDOW_DIMENSIONS < <(getWindowDimensions ${ID})

NEW_WIDTH="$(imul "${WINDOW_DIMENSIONS[0]}" "${MULTIPLIER}")"
NEW_HEIGHT="$(imul "${WINDOW_DIMENSIONS[1]}" "${MULTIPLIER}")"

printf "%sx%s -> %sx%s\n" \
	${WINDOW_DIMENSIONS[0]} ${WINDOW_DIMENSIONS[1]} \
	${NEW_WIDTH} ${NEW_HEIGHT}

xdotool windowsize ${ID} "${NEW_WIDTH}" "${NEW_HEIGHT}"
xdotool windowmove ${ID} \
	$((SCREEN_DIMENSIONS[0] - NEW_WIDTH)) \
	$((0 + BAR_OFFSET))
