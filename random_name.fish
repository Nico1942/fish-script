#!/usr/bin/fish

function help 
  echo "Se debe ingresar el número de letras del nombre."
  echo "Usar -r para nombre aleatorio."
  exit 1
end

function main
  set VOCALES a e i o u
  set CONSONANTES b bl br bs bv c cl cr ct d dr f fl fr g gr h j k l ll m mn n p pl pr qu r rr s sl st sm t tr tl v w x y z

  set LARGO $argv[1] 

  if test $LARGO -gt 10
    set LARGO 10
    echo "Tamaño máximo: $LARGO."
  end

  if test $LARGO -lt 2
    set LARGO 2
    echo "Tamaño mínimo: $LARGO."
  end

  set NOMBRE ""


  set LETRA (random 1 2)

  for i in (seq 1 $LARGO)
    if test $LETRA = 1
      set INDICE (random 1 (count $CONSONANTES))
      set NOMBRE (echo $NOMBRE$CONSONANTES[$INDICE])
      set LETRA 2
    else
      set INDICE (random 1 (count $VOCALES))
      set NOMBRE (echo $NOMBRE$VOCALES[$INDICE])
      set LETRA 1
    end
    if test $i = 1
      set NOMBRE (string upper $NOMBRE)
    end
  end

  echo "Tu nombre es $NOMBRE"

end

if test $argv[1]
  and string match -qr '^[0-9]+$' $argv[1]
  main $argv[1]
else if test $argv[1]
  main (random 2 10)
else
  help
end

