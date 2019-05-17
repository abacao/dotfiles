#!/bin/bash
# suspend message display
pkill -u "$USER" -USR1 dunst

# lock the screen
#i3lock -n -e -c 301330 -f
i3lock -n -e -f -c 101010 -i ~/Desktop/talkdesk_logo.png -t

# resume message display
pkill -u "$USER" -USR2 dunst
