function yip

  # Set up
  ## UI
  set FRONT_COLOR 11cf18
  set BACK_COLOR 8c4646
  set TIME_SLOW 0.3
  set TIME_FAST 0.07

  set HOY (date +%j)
  set CIEN (date +%j -d "Dec 31")
  set PORCENTAJE (math -s0 (math 100/$CIEN) \* $HOY)

  set_color -o
  set_color white
  echo "Progreso anual:"

  set BARRA (math -s0 $PORCENTAJE / 10)

  set_color -o $FRONT_COLOR
  for i in (seq 1 $BARRA)
    sleep $TIME_SLOW
    echo -en "⣿"
  end

  sleep $TIME_SLOW

  set_color $BACK_COLOR
  for i in (seq 1 (math 10 - $BARRA))
    sleep $TIME_FAST
    echo -en "⣿"
  end

  sleep 0.5
  set_color -o $FRONT_COLOR
  echo " $PORCENTAJE%"
  sleep 0.5

end
