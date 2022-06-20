#!/bin/bash

# TODO: resize keeping geometry
#       xdotool getwindowgeometry ${ID} | grep Geometry
# TODO: place in different corner
#       https://gist.github.com/andrewmcdonough/88246/81d540704fdd7b753083da7e5e718abc23b87467
# TODO: offset toolbar size
# TODO: visible on all windows

set -exuo pipefail

getID() {
	xdotool search --class mpv ||
		xdotool search --name picture-in-picture
}

ID="$(getID)"

xdotool windowsize ${ID} 200 100
xdotool windowmove ${ID} 0 0
