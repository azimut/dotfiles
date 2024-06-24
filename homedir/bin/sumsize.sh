#!/bin/sh

[ $# -eq 0 ] && {
	echo "ERROR: no file arguments given!"
	echo "Returns the total size of all the files given."
	echo "Usage:"
	printf "\t%s FILES...\n" "$(basename $0)"
	exit 1
}

printf 'files: %d\n' $#
printf 'size: %s\n' "$(stat --format='%s' "$@" | datamash sum 1 | numfmt --to='iec-i')"
