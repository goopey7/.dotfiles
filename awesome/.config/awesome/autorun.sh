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
