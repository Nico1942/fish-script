#!/usr/bin/env fish

set extension "tilingshell@ferrarodomenico.com"
set nombre (gnome-extensions info $extension | awk -F ': ' '/Nombre/ {print $2}')
set estado (gnome-extensions info $extension | awk '/ Estado: / {print $2}') 

if [ "$estado" = "ACTIVE" ]
  gnome-extensions disable $extension
  echo "Desactivando extensión $nombre"
else
  gnome-extensions enable $extension
  echo "Activando extensión $nombre"
end
