#!/bin/bash

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

if [ $keybLayout = "be" ]; then
  cp $HOME/.config/qtile/config-azerty.py $HOME/.config/qtile/config.py
fi

waypaper --backend feh --restore 

run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray & # bluethod
picom --config $HOME/.config/qtile/setup_complements/picom/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

run volumeicon & 
