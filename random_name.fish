# Defined in - @ line 42

set MIN 2
set MAX 10

function help 
  echo "Se debe ingresar el número de letras del nombre.
Entre $MIN y $MAX"
  echo "Usar -r para nombre aleatorio."
end

function main
  set VOCALES a e i o u
  set CONSONANTES b bl br bs bv c cl cr ct d dr f fl fr g gr h j k l ll m mn n ñ p pl pr qu r rr s sl st sm t tr tl v w x y z
 # set CONSONANTES b c d f g h j k l m n ñ p qu r s t v w x y z bl br bs bv cl cr ct dr fl fr gr ll mn pl pr rr sl st sm tr tl

  set LARGO $argv

  set NOMBRE ""


  set LETRA (random choice vocal consonante)

  for i in (seq 1 $LARGO)
    if test $LETRA = consonante 
      set INDICE (random 1 (count $CONSONANTES))
      set NOMBRE (echo $NOMBRE$CONSONANTES[$INDICE])
      set LETRA vocal
    else
      set INDICE (random 1 (count $VOCALES))
      set NOMBRE (echo $NOMBRE$VOCALES[$INDICE])
      set LETRA consonante
    end
  end

  set NOMBRE (capitalize $NOMBRE)

  echo "Tu nombre es $NOMBRE"

end

function random_name
  set LIMITE (seq 2 10)
  if contains -- $argv $LIMITE
    main $argv[1]
  else if contains -- -r $argv 
    main (random 2 10)
  else
    help
  end
end
