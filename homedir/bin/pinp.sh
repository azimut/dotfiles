#!/bin/bash

set -euo pipefail

imul() { awk -v a="$1" -v b="$2" 'BEGIN { print(int(a*b)) }'; }

getWindowID() {
	xdotool search --name 'picture-in-picture' ||
		xdotool search --onlyvisible --class 'mpv'
}

getScreenDimensions() { xrandr | awk '/current/{ print($8, int($10)) }'; }
getWindowDimensions() { xdotool getwindowgeometry "$1" | awk '/Geometry/{ gsub("x"," "); print($2,$3) }'; }

usage() {
	echo -e "Usage:\n\t$(basename $0) [-p TR|TL|BR|BL] [-m MULTIPLIER] [-o OFFSET]"
	exit 1
}

while getopts ":hp:m:o:" arg; do
	case $arg in
	h) usage ;;
	p) POSITION="$OPTARG" ;;
	m) MULTIPLIER="$OPTARG" ;;
	o) BAR_OFFSET="$OPTARG" ;;
	*) usage ;;
	esac
done

POSITION="${POSITION:-TR}"
MULTIPLIER="${MULTIPLIER:-1}"
BAR_OFFSET="${BAR_OFFSET:-20}"

ID="$(getWindowID)"

read -r -a SCREEN_DIMENSIONS < <(getScreenDimensions)
read -r -a WINDOW_DIMENSIONS < <(getWindowDimensions ${ID})

NEW_WIDTH="$(imul "${WINDOW_DIMENSIONS[0]}" "${MULTIPLIER}")"
NEW_HEIGHT="$(imul "${WINDOW_DIMENSIONS[1]}" "${MULTIPLIER}")"

printf "%sx%s -> %sx%s\n" \
	${WINDOW_DIMENSIONS[0]} ${WINDOW_DIMENSIONS[1]} \
	${NEW_WIDTH} ${NEW_HEIGHT}

xdotool windowsize ${ID} "${NEW_WIDTH}" "${NEW_HEIGHT}"

case $POSITION in
TR)
	x=$((SCREEN_DIMENSIONS[0] - NEW_WIDTH))
	y=$((BAR_OFFSET))
	;;
TL)
	x=0
	y=$((BAR_OFFSET))
	;;
BL)
	x=0
	y=$((SCREEN_DIMENSIONS[1] - NEW_HEIGHT - BAR_OFFSET))
	;;
BR)
	x=$((SCREEN_DIMENSIONS[0] - NEW_WIDTH))
	y=$((SCREEN_DIMENSIONS[1] - NEW_HEIGHT - BAR_OFFSET))
	;;
*)
	echo "ERROR: invalid position"
	exit 1
	;;
esac

xdotool windowmove ${ID} "${x}" "${y}"
