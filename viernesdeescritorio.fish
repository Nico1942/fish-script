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
    end

    yasfetch-fedora
    ext-fetch
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
