#!/bin/bash -xe
exec xautolock -detectsleep \
  -time 1 \
  -locker "i3locking.sh" \
  -notify 10 \
  -notifier 'notify-send -u critical -t 500 -i kscreensaver -- "Will lock screen in 10s"'
