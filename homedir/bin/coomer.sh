#!/bin/bash

set -euo pipefail

container_and_file() {
	for link in ~/.coomer/*jpg ~/.coomer/*png; do
		if [[ ! -L ${link} ]]; then
			continue
		fi
		file=$(readlink ${link})
		container=${file%/*}
		container=${container##*/}
		echo ${container},${file}
	done
}

container_and_file |
	sort -k1,1 -t, |
	cut -f2 -d, |
	xargs feh --slideshow-delay 5 --auto-zoom --fullscreen
