#!/usr/bin/env fish

set extension "mediacontrols@cliffniff.github.com"
set nombre (gnome-extensions info $extension | awk -F ': ' '/Nombre/ {print $2}')
set estado (gnome-extensions info $extension | awk '/ Estado: / {print $2}') 

if [ "$estado" = "ACTIVE" ]
  gnome-extensions disable $extension
  set estado_txt "desactivada"
else
  gnome-extensions enable $extension
  set estado_txt "activada"
end

notify-send "▶️ Extension $nombre $estado_txt"
echo "▶️ Extension $nombre $estado_txt"
