function toggle-donotdisturb
	set -l notifications (gsettings get org.gnome.desktop.notifications show-banners)

	if [ $notifications = "true" ]
		gsettings set org.gnome.desktop.notifications show-banners false
	else
		gsettings set org.gnome.desktop.notifications show-banners true
	end
end
