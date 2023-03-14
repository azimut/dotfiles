#!/bin/bash
# Usage:
# ./gksu.sh somefile.pdf ls -l
set -exuo pipefail

[[ ! -f ${1} ]] && {
	notify-send \
		"$0" \
		"<span color='#573333' font='26px'>File (${1}) does not exists!</span>"
	exit 1
}
FILE="${1}"
shift

has_sudo() { sudo -n true; }
ask_for_password() {
	notify-send \
		"${0}" \
		"<span color='#57dafd' font='26px'>Enter the password on console...</span>"
}

if [[ -O ${FILE} ]]; then
	"${@}" "${FILE}"
else
	has_sudo || ask_for_password
	sudo "${@}" "${FILE}"
fi
