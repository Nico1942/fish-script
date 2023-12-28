# Defined in - @ line 17

set RESOLUTION (miResolucion)

function ayuda
  echo "Se debe ingresar primero el archivo a editar y luego el nombre del archivo editado."
  echo "Si no se ingresa un nombre de salida, el archivo tendrá el sufijo '_mod'."
  echo "Tamaño de pantalla: $RESOLUTION"
end

function unArgumento
  set FILE (echo $argv | cut -d '.' -f1)
  set EXT (echo $argv | cut -d '.' -f2)
  set OUTPUT (echo $FILE'_mod.'$EXT)
  convert $argv -resize $RESOLUTION $OUTPUT
end

function miWall
  if test (count $argv) = 2
      convert $argv[1] -resize $RESOLUTION $argv[2];
  else
    if test (count $argv) = 1
      unArgumento $argv
    else
      ayuda
    end
  end
end
