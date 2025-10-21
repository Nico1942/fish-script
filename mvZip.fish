function mvZip --wraps='mv {*.rar, *.zip, *.7z, *.xz} ./zip' --description 'alias mvZip mv {*.rar, *.zip, *.7z, *.xz} ./zip'
	cd $(xdg-user-dir DOWNLOAD)
	mv {*.rar, *.zip, *.7z, *.xz} ./zip $argv

end
