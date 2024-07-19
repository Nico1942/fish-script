function viernesdeescritorio
    set dia (capitalize (date +%A))
    set fecha (date +%F_%H.%M_%s)
    set captura false

    if contains -- -c $argv
      cls
    end
    if contains -- -s $argv
        set captura true
    end
    if contains -- --off $argv
      set arg1 --off
    end
    if contains -- --all $argv
      set arg2 --all
    end

    if contains -- --help -h $argv || contains -- -h $argv
      echo "Ayuda: 
      -c:    Limpia la pantalla antes
      -s:    Hace captura de pantalla
      --off: Sin logos
      --all: Mustra también las extensiones instaladas"
      else

        yasfetch $arg1
        ext-fetch $arg1 $arg2
        echo
        yip -no-time
        echo
        echo "#"$dia"DeEscritorio :D" | lolcat -b
        echo

        if $captura
	  mkdir -p (xdg-user-dir PICTURES)/Escritorios
    	  set archivo (xdg-user-dir PICTURES)/Escritorios/$fecha.png
          gnome-screenshot -f "$archivo"
          flatpak run org.gnome.Loupe $archivo &>/dev/null &
      end

    end
end
