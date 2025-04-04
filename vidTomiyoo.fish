function vidTomiyoo --description 'convertir un video para reproducirlo en la miyoo'
	set width 640
	set max_height 480

	set extension (string split '.' $argv[1])[-1]
	set archivo (string split . $argv[1])[1]
	set salida (echo $archivo"_miyoo."$extension)

	# Obtener la resolución original del video
    set resolution (ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 $argv[1])
    set original_width (string split , $resolution)[1]
    set original_height (string split , $resolution)[2]

    # Calcular la nueva altura manteniendo la proporción
    set height (math -s 0 "($original_height * $width) / $original_width")

    # Ajustar si la altura supera el máximo permitido
    if test $height -gt $max_height
        set height $max_height
        set width (math -s 0 "($original_width * $max_height) / $original_height")
    end

    # Asegurarse de que width y height sean números pares
    if test (math "$width % 2") -ne 0
        set width (math "$width - 1")
    end
    if test (math "$height % 2") -ne 0
        set height (math "$height - 1")
    end


    echo "Extension: $extension Archivo: $archivo Salida: $salida"
    echo "Resolución original: $original_width x $original_height"
    echo "Nueva resolución: $width x $height"


	ffmpeg -i $argv -vf scale=$width:$height $salida
end