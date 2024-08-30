#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
feh --randomize --bg-fill /home/tipparn/.wallpaper &
#$HOME/.dwm/dwmblocks/dwmblocks &
numlockx on
xset r rate 300 50 &
picom --xrender-sync-fence &
setxkbmap-  option ctrl:nocaps &
xmodmap -e "keycode 66 = Escape" &
/usr/bin/lxpolkit &
unclutter &
wal --theme tokyomoon &
#pipewire &
#pipewire-pulse 
