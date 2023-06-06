#!/bin/bash
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
#run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
#run xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#run xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal
run nm-applet
#run caffeine
run xfce4-power-manager
run blueberry-tray
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on
run volumeicon
run /usr/bin/pipewire &
run /usr/bin/pipewire-pulse &
run /usr/bin/pipewire-media-session &
#run nitrogen --restore
run conky -c $HOME/.config/awesome/system-overview
#you can set wallpapers in themes as well
feh --bg-fill ~/background.jpg &
#run applications from startup
#run firefox
#run atom
#run dropbox
#run insync start
#run spotify
#run ckb-next -b
#run discord
#run telegram-desktop

# map caps key to escape
setxkbmap -option caps:escape

polychromatic-tray-applet
xinput --set-prop 8 'libinput Accel Speed' 0

run xbanish
