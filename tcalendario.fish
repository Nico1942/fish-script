function tcalendario
	# Variable manana y ayer definidas en conf.fish

    set anterior $ayer
    set siguiente $manana
    set dia_ayer "AYER"
    set dia_despues "MAÑANA"
    
    if [ (date -d "yesterday" +%u) = 7 ]
        set anterior (date -d "yesterday - 2 days" +%Y-%m-%d)
        set dia_ayer "VIERNES"
    end
    
    if [ (date -d "tomorrow" +%u) = 6 ]
        set siguiente $lunes
        set dia_despues "LUNES"
    end
    
    echo -e "$dia_ayer\n===="; t ls due:$anterior;echo;echo -e "$dia_despues\n======"; t ls due:$siguiente
end
