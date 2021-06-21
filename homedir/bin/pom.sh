#!/bin/bash

set -exuo pipefail

pgrep mpd

# Can optionally start at pomodoro N on a given day (if I need to reboot, etc).
if [ $# -eq 0 ]; then
    printf "\nBeginning workday %s...\n" "$(date +%Y-%m-%d)" >> ${HOME}/pom.log
    POM=1
elif [ $# -eq 1 ]; then
    POM=$1
else
    echo "Synopsis: pom.sh [<pom-start>]"
    exit 1
fi

# The show's not over until ctrl-C sings
while true; do
    # Start MPD playing
    mpc play > /dev/null

    focus-mode work

    # Countdown 25 minutes
    start=$(date +%H:%M:%S)
    printf "\rBeginning pomodoro %s at %s\n" "${POM}" "${start}"
    i=25
    while [ $i -gt 0 ]; do
        printf "\r  %s mins \b" $i
        sleep 60
        ((i--))
    done
    printf "\r               \b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"

    # Stop MPD playing
    mpc pause > /dev/null

    # Send notification
    notify-send -i applications-games -t 10000 "Play" "Hey, it's time to take a break\!"

    # Play "take a break" sound
    #mpg123 ~/bin/horn.mp3 2> /dev/null

    # Display "what did you achieve" text-box
    #(sleep 3; wmctrl -r Pomodoro -e 0,640,600,-1,-1; wmctrl -R Pomodoro; wmctrl -r Pomodoro -b add,above,sticky) &
    focus-mode relax
    feedback="$(zenity --entry \
                       --title="Pomodoro" \
                       --text="Pomodoro ${POM} ended. What did you achieve\?" \
                       --width=1000 2> /dev/null)"

    # After break, user clicks "OK". Log comment and begin next pomodoro.
    echo "  ${POM}@${start}: ${feedback}" >> ${HOME}/pom.log
    sleep $((60 * 5))
    ((POM++))
done
