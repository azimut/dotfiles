#!/bin/bash

if [[ ! -s $1 ]]; then
	echo "Description: returns the volume loudness of the passed file."
	echo -e "Usage:\n\t\$ ${0##*/} <FILENAME>"
	exit 1
fi

ffmpeg -i "$1" -af volumedetect -sn -dn -vn -f null /dev/null 2>&1 |
	awk -v filename="$(basename "$1")" \
		'/mean_volume/ { print $5, filename }'
