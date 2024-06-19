#!/bin/sh -eu

# Description: Returns the oldest url available
# Documentation: https://archive.org/help/wayback_api.php

[ $# -ne 1 ] && echo "Error: needs an url parameter." && exit 1

curl -s "http://archive.org/wayback/available?url=${1%#*}&timestamp=19960101" |
	jq -r '.archived_snapshots.closest | .status + " " + .url'
