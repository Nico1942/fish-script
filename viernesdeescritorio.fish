function viernesdeescritorio
	set dia (capitalize (date +%A))
	set fecha (date +%F_%H.%M_%s)
	set captura false
	set fastfetchDir "$HOME/bin/fetch/fastfetch-conf"

	contains -- -k $argv; and set img true; or set img false

	contains -- -c $argv; and clear
	contains -- -s $argv; and set captura true

	contains -- --off $argv; and set arg1 --off
	contains -- --all $argv; and set arg2 --all

	# --- Ayuda memoria. ---
	if contains -- --help -h $argv || contains -- -h $argv
		echo "Ayuda: 
		-c:    Limpia la pantalla antes
		-s:    Hace captura de pantalla
		-k:    Usar imágen en lugar de ascii (terminal kitty)
		--off: Sin logos
		--all: Muestra las extensiones desactivadas"
		return
	end

	# --- MAIN ---

	if $img
		fastfetch -c $fastfetchDir/yast.jsonc
		set space "--space 8"
	else
		yasfetch $arg1
	end

	ext-fetch $arg1 $arg2 $space
	echo
	yip -no-time
	echo
	echo "#"$dia"DeEscritorio :D" | lolcat -b
	echo

	if $captura
		mkdir -p (xdg-user-dir PICTURES)/Escritorios
		set archivo (xdg-user-dir PICTURES)/Escritorios/$fecha.png
		gnome-screenshot -p -f "$archivo"
		loupe $archivo &>/dev/null &
	end

end
