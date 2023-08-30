#!/bin/sh
run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

#run discord
run xbanish
# map caps key to escape
setxkbmap -option caps:escape
