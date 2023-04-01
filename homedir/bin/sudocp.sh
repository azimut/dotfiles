#!/bin/bash

has_sudo() { sudo -n true; }
notify() {
	local msg
	msg="${1}"
	notify-send "${0}" "<span color='#57dafd' font='26px'>${msg}</span>"
}
ask_for_password() {
	notify 'Enter the password on console...'
}

CACHEFILE="${HOME}"/.cache/sxiv/copydir.tmp

if [[ -s ${CACHEFILE} ]]; then
	target=$(zenity --file-selection --filename="$(cat ${CACHEFILE})" --directory)
else
	target=$(zenity --file-selection --filename="${HOME}" --directory)
fi

[[ -z ${target} ]] && exit 1
[[ ! -d ${target} ]] && exit 1

echo "${target}" >${CACHEFILE}

if [[ ! -O ${target} ]]; then
	has_sudo || ask_for_password
	if [[ -n "${1}" ]]; then
		sudo cp -vu "${1}" "${target}" || notify 'failed to cp'
	else
		while read -r image; do
			sudo cp -vu "${image}" "${target}" || notify 'failed to cp'
		done
	fi
else
	if [[ -n "${1}" ]]; then
		cp -vu "${1}" "${target}" || notify 'failed to cp'
	else
		while read -r image; do
			cp -vu "${image}" "${target}" || notify 'failed to cp'
		done
	fi
fi
