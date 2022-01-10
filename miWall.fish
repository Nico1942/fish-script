# Defined in - @ line 15

set RESOLUTION (xdpyinfo | awk '/dimensions:/ { print $2 }')

function ayuda
  echo "Se debe ingresar primero el archivo a editar y luego el nombre del archivo editado."
  echo "Si no se ingresa un nombre de salida, el archivo tendrá el sufijo '_mod'."
  echo "Tamaño de pantalla: $RESOLUTION (16:10)"
end

function unArgumento
  set FILE (echo $argv[1] | cut -d '.' -f1)
  set EXT (echo $argv[1] | cut -d '.' -f2)
  set OUTPUT (echo $FILE'_mod.'$EXT)
  convert $argv[1] -resize $RESOLUTION $OUTPUT
end

function miWall
  if test "$argv[1]" = ""
    ayuda
  else
    if test "$argv[2]" = ""
      unArgumento $argv[1]
    else
      convert $argv[1] -resize $RESOLUTION $argv[2];
    end
  end
end
