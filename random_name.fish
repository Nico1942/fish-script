# Defined in - @ line 47

function help 
  echo "Se debe ingresar el número de letras del nombre."
  echo "Usar -r para nombre aleatorio."
end

function main
  set VOCALES a e i o u
  set CONSONANTES b bl br bs bv c cl cr ct d dr f fl fr g gr h j k l ll m mn n ñ p pl pr qu r rr s sl st sm t tr tl v w x y z
 # set CONSONANTES b c d f g h j k l m n ñ p qu r s t v w x y z

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
  end

  set NOMBRE (echo $NOMBRE | sed 's/[^_-]*/\u&/g')

  echo "Tu nombre es $NOMBRE"

end

function random_name
  if string match -qr '^[0-9]+$' $argv
    main $argv[1]
  else if [ $argv = "-r" ]
    main (random 2 10)
  else
    help
  end
end
