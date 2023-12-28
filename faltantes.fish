#!/usr/bin/fish

if [ "$argv" != "--nada" ]
  if [ -e ayer.txt ]
    rm ayer.txt
  end
  
  if [ -e hoy.txt ]
    mv hoy.txt ayer.txt
  end
  
  nvim hoy.txt
end

cls

echo "Faltantes:"
echo "=========="
diff -u hoy.txt ayer.txt | diff-so-fancy
echo
echo "Nuevos faltantes"
echo "================"
diff ayer.txt hoy.txt | grep ">"

echo
echo "Lo que volvió"
echo "============="
diff ayer.txt hoy.txt | grep "<"
echo
echo
cal --sunday -3
echo

# Hace captura
# gnome-screenshot --window --delay 1 --file $PWD/../(date +%m-%d).png
