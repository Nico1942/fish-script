function toggle-cafe
	set estado (gnome-extensions info caffeine@patapon.info | awk '/Estado: / {print $2}')
	if test "$estado" != "ACTIVE"
		gnome-extensions enable caffeine@patapon.info
		notify-send "Café activado"
	else
		gnome-extensions disable caffeine@patapon.info
		notify-send "Café desactivado"
	end
end
