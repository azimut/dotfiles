#!/bin/bash

# Description:
# Generates a custom file:// "link" from the currently focused pdf viewer.
# Link is saved on clipboard (xclip).
# Link can be opened on firefox.

set -exuo pipefail

function getPage {
	local fullpath="${1}"
	gio info -a 'metadata::evince::page' "${fullpath}" | grep -Eo '[0-9]+$'
}

function getFocusPid {
	xdotool getwindowfocus getwindowpid
}

function getOpenPDF {
	local pid="${1}"
	local file
	for fd in /proc/"${pid}"/fd/*; do
		file="$(readlink ${fd})"
		if [[ ${file} == *.pdf ]]; then
			echo "${file}"
			break
		fi
	done
}

pid="$(getFocusPid)"
path="$(getOpenPDF "${pid}")"
page="$(getPage "${path}")"

printf 'file://%s#page=%s' "${path}" "${page}" | xclip -selection clipboard
notify-send 'pdflink.sh' '<span color="#57dafd" font="26px">pdflink copied to clipboard</span>'
