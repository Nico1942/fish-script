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

    set arg1 (contains -- --off $argv; and echo "--off")
    set arg2 (contains -- --all $argv; and echo "--all")

    # Ayuda memoria.
    if contains -- --help -h $argv || contains -- -h $argv
      echo "Ayuda: 
      -c:    Limpia la pantalla antes
      -s:    Hace captura de pantalla
      --off: Sin logos
      --all: Muestra las extensiones desactivadas"
      return
    end

    # Comandos principales

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
      gnome-screenshot -p -f "$archivo"
      loupe $archivo &>/dev/null &
    end

end
