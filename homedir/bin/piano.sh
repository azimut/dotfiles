#!/bin/bash

SESSION='piano'
SF='/usr/local/share/samples/sf_GMbank.sf2'
OPTS=()
# OPTS=(-R yes)

if ! aconnect -i | grep "client 20: 'CH345'"; then
	echo "Midi cable not connected?"
	exit 1
fi

if tmux has -t "${SESSION}"; then
	echo "attaching session...${SESSION}"
	if [[ -z $TMUX ]]; then
		tmux attach -t "${SESSION}"
	else
		tmux switch-client -t "${SESSION}"
	fi
	exit 0
fi

tmux new -d -s "${SESSION}" \; \
	switch-client -t "${SESSION}" \; \
	split-window -h midihack \; \
	split-window -v fluidsynth "${OPTS[@]}" --gain 1 -a alsa "${SF}" \; \
	select-pane -L

aconnect 20:0 130:0  # piano    -> midihack
sleep 2              # wait for fluidsynth to be ready
aconnect 130:1 131:0 # midihack -> fluidsynth
