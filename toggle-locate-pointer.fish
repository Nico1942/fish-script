#!/usr/bin/env fish

# Obtener estado actual
set current_state (gsettings get org.gnome.desktop.interface locate-pointer)

if test $current_state = "true"
    gsettings set org.gnome.desktop.interface locate-pointer false
    notify-send "🔕 Localización del puntero DESACTIVADA."
else
    gsettings set org.gnome.desktop.interface locate-pointer true
    notify-send "🔔 Localización del puntero ACTIVADA."
end

