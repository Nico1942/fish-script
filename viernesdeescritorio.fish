function viernesdeescritorio
    set dia (capitalize (date +%A))
    set fecha (date +%F_%H.%M_%s)
    set archivo "$HOME/Imágenes/Escritorios/$fecha.png"

    cls
    yasfetch-fedora
    ext-fetch
    echo
    yip -no-time
    echo
    echo "#"$dia"DeEscritorio :D" | lolcat -b
    echo
    sleep 1
    gnome-screenshot -f "$archivo"

    flatpak run org.gnome.Loupe $archivo &>/dev/null &

end
