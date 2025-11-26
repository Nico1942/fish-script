function tedit --wraps='cd ~/Documentos/TODO.TXT/;n todo.txt' --description 'Editar todo.txt con editor de texto'
	set file "$HOME/Documentos/TODO.TXT/todo.txt"

	switch $argv
		case "-s"
			subl $file
		case "-g"
			gnome-text-editor $file
		case "-v"
			nvim $file
		case "*"
			echo "-s: sublime text"
			echo "-g: gnome text editor"
			echo "-v: neovim"
	end
end
