#!/bin/bash

set -euo pipefail

usage() {
	echo "Returns the image size of a remote or local docker image."
	echo -e "\t$ $(basename "$0") <IMAGE>"
}

(($# != 1)) && {
	echo "ERROR: missing argument!"
	usage
	exit 1
}

docker manifest inspect "$1" |
	jq '.layers | [.[].size] | add' |
	numfmt --to=iec-i
