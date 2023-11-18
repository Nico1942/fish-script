function viernesdeescritorio
    set dia (capitalize (date +%A))
    set fecha (date +%F_%H.%M_%s)
    set archivo "$HOME/Imágenes/Escritorios/$fecha.png"

    for i in $argv
        if test "$i" = -c
            cls
        end
        if test "$i" = -s
            set captura true
        end
        if test "$i" = --off
            set arg1 --off
        end
        if test "$i" = --all
            set arg2 --all
        end
    end

    yasfetch-fedora $arg1
    ext-fetch $arg1 $arg2
    echo
    yip -no-time
    echo
    echo "#"$dia"DeEscritorio :D" | lolcat -b
    echo

    if test "$captura" = true
        gnome-screenshot -f "$archivo"
        flatpak run org.gnome.Loupe $archivo &>/dev/null &
    end
end
