#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
wal --theme solarized &
run "unclutter"
#run "nm-applet"
#run "blueberry-tray"
run "/usr/bin/lxpolkit"
run "numlockx on"
#run "volumeicon"
#run "signal-desktop"
feh --randomize --bg-fill /home/tipparn/.wallpaper
xset r rate 300 50
setxkbmap -option ctrl:nocaps
xmodmap -e "keycode 66 = Escape"
#run "$HOME/.config/awesome/scripts/init_blackwidow.py"
