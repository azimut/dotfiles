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
	tmux attach -t "${SESSION}"
	exit 0
fi

tmux new -s "${SESSION}"

tmux split-window -h midihack                                         # 130?
tmux split-window -v fluidsynth "${OPTS[@]}" --gain 1 -a alsa "${SF}" # 131?
tmux split-window -v zsh

aconnect 20:0 130:0  # piano    -> midihack
sleep 2              # wait for fluidsynth to be ready
aconnect 130:1 131:0 # midihack -> fluidsynth
