#!/usr/bin/env fish

# Setting up
# Colores
set bold (tput bold 2>/dev/null)
set red (tput setaf 1 2>/dev/null)
set cyan (tput setaf 6 2>/dev/null)

set reset (tput sgr0 2>/dev/null)

# Funciones

function mostrarArchivo
  if [ -e "$argv" ]
    cat "$argv"
  else
    echo $red"No hay datos"$reset
  end
end

if [ "$argv" != "--nada" ]
  if [ -e ayer.txt ]
    rm ayer.txt
  end
  
  if [ -e hoy.txt ]
    mv hoy.txt ayer.txt
  end
  
  nvim hoy.txt
end

if [ -e sigue.txt ]
  rm sigue.txt
end

if [ -e vuelve.txt ]
  rm vuelve.txt
end

if [ -e nuevo.txt ]
  rm nuevo.txt
end

# Elimino tabuladores y línes vacías
set hoy (cat hoy.txt | sed 's/\t.*//g; s/^$//g')
set ayer (cat ayer.txt | sed 's/\t.*//g; s/^$//g')

for i in $ayer
  if contains $i $hoy
    grep "$i" hoy.txt | sed 's/^/> /g' >> sigue.txt
  else
    grep "$i" ayer.txt | sed 's/^/👍️ /g; s/\t/ /g' >> vuelve.txt
  end
end

for i in $hoy
  if not contains $i $ayer
    grep "$i" hoy.txt | sed 's/^/👎️ /g; s/\t/ /g' >> nuevo.txt
  end
end


cls

echo $bold"Faltantes:
==========$reset"
mostrarArchivo hoy.txt
echo
echo $bold"Lo que volvió"
echo "=============$reset$cyan"
mostrarArchivo vuelve.txt
echo $reset
echo $bold"Nuevos faltantes"
echo "================$reset$red"
mostrarArchivo nuevo.txt
echo
cal --sunday -3 -w
echo

# Hace captura
# gnome-screenshot --window --delay 1 --file $PWD/../(date +%m-%d).png
