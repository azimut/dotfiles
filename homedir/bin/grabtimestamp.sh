#!/bin/bash

set -euo pipefail

getMPVProp() {
	local prop="${1}"
	qdbus org.mpris.MediaPlayer2.mpv \
		/org/mpris/MediaPlayer2 \
		org.freedesktop.DBus.Properties.Get \
		org.mpris.MediaPlayer2.Player \
		"${prop}"
}

getMPVFile() {
	getMPVProp 'Metadata' | grep -F xesam:url | cut -f2 -d ' '
}

getMPVRawPosition() {
	getMPVProp 'Position'
}

getMPVPosition() {
	local position hh mm ss
	position="$(getMPVRawPosition)"
	hh=$((position / 1000000 / 60 / 60))
	mm=$((position / 1000000 / 60))
	ss=$((position / 1000000 % 100))
	printf "%02d:%02d:%02d" "${hh}" "${mm}" "${ss}"
}

main() {
	printf "[[%s][%s]]" "$(getMPVFile)" "$(getMPVPosition)"
}
main
