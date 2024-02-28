#!/bin/bash

if [[ ! -s $1 ]]; then
	echo "Return the volume loudness of the passed file."
	echo -e "Usage:\n\t\$ ${0##*/} <FILENAME>"
	exit 1
fi

ffmpeg -i "$1" -af volumedetect -sn -dn -vn -f null /dev/null |&
	awk -v filename="$(basename "$1")" \
		'/mean_volume/ { printf("%6s  %s\n", sprintf("%-+.2f", $5), filename) }'
