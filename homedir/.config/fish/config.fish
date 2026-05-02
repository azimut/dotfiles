source ~/bashrc/aliasrc
set fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
end
if status is-interactive
    bind alt-backspace backward-kill-path-component
end
set -U __done_notification_urgency_level critical
set -U __done_notification_duration (math 5 x 60 x 1000)
set -U --append __done_exclude '^mpv'
set -U --append __done_exclude '^mupdf'
set -U --append __done_exclude '^evince'
set -U --append __done_exclude '^sxiv'
set -U --append __done_exclude '^display'
set -U --append __done_exclude '^visor'
set -U --append __done_exclude '^gv'
