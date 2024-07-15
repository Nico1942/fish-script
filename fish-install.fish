function fish-install --description 'install a fish script in fish functions directory'
	set fish_functions ~/.config/fish/functions
	
	echo $argv

	symlink $argv $fish_functions
end
