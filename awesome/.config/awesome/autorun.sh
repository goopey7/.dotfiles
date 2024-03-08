#!/bin/sh
run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

#run discord
ckb-next -b &
run xbanish
# map caps key to escape
setxkbmap -option caps:escape
run nm-applet
picom
xinput set-prop "$(xinput list --name-only | grep -i touch)" "libinput Tapping Enabled" 1
xinput set-prop 9 340 0
xinput set-prop 11 340 0
