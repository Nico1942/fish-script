function yip
  set HOY (date +%j)
  set CIEN (date +%j -d "Dec 31")
  set PORCENTAJE (math -s0 (math 100/$CIEN) \* $HOY)

  set_color -o
  echo "Progreso anual:"
  set_color normal

  set BARRA (math -s0 $PORCENTAJE / 10)

  set_color -o fc0d0d
  for i in (seq 1 $BARRA)
    echo -en "⣿"
  end

  set_color normal
  set_color 8c4646
  for i in (seq 1 (math 10 - $BARRA))
    echo -en "⣿"
  end

  set_color -o fc0d0d
  echo " $PORCENTAJE%"

end
