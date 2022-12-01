#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
#nm-applet &
#run "blueberry-tray"
feh --randomize --bg-fill /home/tipparn/.wallpaper &
$HOME/.dwm/dwmblocks/dwmblocks &
numlockx on
#volumeicon
xset r rate 300 50 &
setxkbmap -option ctrl:nocaps &
xmodmap -e "keycode 66 = Escape" &
picom --xrender-sync-fence &
/usr/bin/lxpolkit &
unclutter &
wmname LG3D &
wal --theme solarized &
#emacs &
#signal-desktop &
#run "sudo $HOME/.config/awesome/scripts/init_blackwidow.py"
