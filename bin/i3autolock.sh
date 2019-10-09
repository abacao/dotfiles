#!/bin/bash -xe

locker=i3locking.sh
#locker=kscreensaver
#locker=slock
#locker=i3lock
no_move_time=1
warning_b4_lock=11
time_of_warning=5000

exec xautolock -detectsleep \
  -time $no_move_time \
  -locker "$locker" \
  -notify $warning_b4_lock \
  -notifier 'notify-send -u critical -t 5000 -i i3locking.sh -- "Will lock screen in 10s"'
