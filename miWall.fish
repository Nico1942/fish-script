# Defined in - @ line 17

set RESOLUTION (miResolucion)

function ayuda
  echo "  Se debe ingresar primero el archivo a editar y luego el nombre
  del archivo editado.
  Si no se ingresa un nombre de salida, el archivo tendrá el sufijo '_mod'.
  Tamaño de pantalla: $RESOLUTION"
end

function unArgumento
  set EXT (echo $argv | awk -F. '{ print $NF }')
  set FILE (echo $argv | basename $argv .$EXT )
  set OUTPUT (echo $FILE'_mod.'$EXT)
  convert $argv -resize $RESOLUTION $OUTPUT
end

function miWall
  if test (count $argv) = 2
      magick $argv[1] -resize $RESOLUTION $argv[2];
  else
    if test (count $argv) = 1
      unArgumento $argv
    else
      ayuda
    end
  end
end
