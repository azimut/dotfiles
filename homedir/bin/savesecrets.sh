#!/bin/bash

SECRETS=(
	"${HOME}/.gnupg"
	"${HOME}/.wsecret"
	"${HOME}/.authinfo.gpg"
	"${HOME}/.bash_secret"
	"${HOME}/.erlang.cookie"
	"${HOME}/.ssh/id_rsa"
	"${HOME}/.ssh/id_rsa.pub"
	"${HOME}/.psql_history"
	"${HOME}/.zsh_history"
	"${HOME}/.bash_history"
	"${HOME}/texts/ideas.org"
	"${HOME}/.newsboat/feeds/twitch-rss.secret"
	"${HOME}/.newsboat/cache.db"
	"${HOME}/.newsboat/history.search"
	"${HOME}/.newsboat/history.cmdline"
	/var/lib/bitlbee
	/var/lib/znc
)

nDESTINATION="${HOME}/disk2/secrets"
mkdir -p "${DESTINATION}"

for secret in "${SECRETS[@]}"; do
	cp -r "${secret}" "${DESTINATION}"/
done
