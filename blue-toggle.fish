#!/usr/bin/env fish

set estado (gnome-extensions info Bluetooth-Battery-Meter@maniacx.github.com | awk '/ Estado: / {print $2}') 

if [ "$estado" = "ACTIVE" ]
  gnome-extensions disable Bluetooth-Battery-Meter@maniacx.github.com
  echo "Desactivando extensión."
else
  gnome-extensions enable Bluetooth-Battery-Meter@maniacx.github.com
  echo "Activando extensión."
end

ext-fetch --off
