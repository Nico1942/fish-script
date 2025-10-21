#!/usr/bin/env fish

set extension "bluetooth-battery@michalw.github.com"
set nombre (gnome-extensions info $extension | awk -F ': ' '/Nombre/ {print $2}')
set estado (gnome-extensions info $extension | awk '/ Estado: / {print $2}') 

if [ "$estado" = "ACTIVE" ]
  gnome-extensions disable $extension
  set estado_noti "desacivada."
else
  gnome-extensions enable $extension
  set estado_noti "activada."
end

notify-send "🎧 Extensión $nombre $estado_noti"
echo "🎧 Extensión $nombre $estado_noti"
