function fish-install --description 'install a fish script in fish functions directory'
	set fish-functions "~/.config/fish/functions/"

	symlink $argv $fish-functions
end
