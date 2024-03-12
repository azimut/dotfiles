#!/bin/bash

SECRETS=(
	"${HOME}/.gnupg"
	"${HOME}/.wsecret"
	"${HOME}/.authinfo.gpg"
	"${HOME}/.bash_secret"
	"${HOME}/.erlang.cookie"
	"${HOME}/.psql_history"
	"${HOME}/.zsh_history"
	"${HOME}/.bash_history"
	"${HOME}/gallery-dl.conf"
	"${HOME}/projects"
	"${HOME}/texts/ideas.org"
	"${HOME}/.ssh/id_rsa"
	"${HOME}/.ssh/id_rsa.pub"
	"${HOME}/.newsboat/feeds/twitch-rss.secret"
	"${HOME}/.newsboat/cache.db"
	"${HOME}/.newsboat/history.search"
	"${HOME}/.newsboat/history.cmdline"
	"${HOME}/.config/exercism/user.json"
	"${HOME}/.config/calibre"
	/var/lib/bitlbee
	/var/lib/znc
)

DESTINATION="${HOME}/prestaging"

set -exuo pipefail

for secret in "${SECRETS[@]}"; do
	dirname="$(dirname "${secret}")"
	dstdir="${DESTINATION}/${dirname#/}"
	mkdir -p "${dstdir}"
	sudo cp -a "${secret}" "${dstdir}"
done
