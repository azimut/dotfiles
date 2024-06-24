#!/bin/sh

[ $# -eq 1 ] && {
	echo "Error: no file arguments given"
	echo "Returns the total size of all the given files."
	echo "Usage:"
	printf "\t%s FILES..." "$(basename $0)"
	exit 1
}

stat --format='%s' "$@" | datamash sum 1 | numfmt --to='iec-i'
