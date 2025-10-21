function yip

    # Set up
    ## UI
    set FRONT_COLOR 11cf18
    set BACK_COLOR 8c4646
    set TIME_SLOW 0.3
    set TIME_FAST 0.07

    ## BARRA
    set SIZE 20
    set STYLE (random 1 5)

    switch $STYLE
        case 1 2 3 4
            set ran_BODY "-" "•"
            set ran_HEAD "⟶" "-" "•" "⊣" "★"
            set ran_FILL $ran_BODY

            set BODY $ran_BODY[(random 1 2)]
            set HEAD $ran_HEAD[(random 1 (count $ran_HEAD))]
            set TO_FILL $ran_FILL[(random 1 2)]

        case 5
            set BODY "⣿"
            set HEAD "$BODY"
            set TO_FILL "$BODY"
    end

    if contains -- -no-time $argv
        set TIME_FAST 0
        set TIME_SLOW 0
    end

    set HOY (date +%j)
    set CIEN (date +%j -d "Dec 31")
    set PORCENTAJE (math -s0 (math 100/$CIEN) \* $HOY)

    set_color -o white
    echo "Progreso anual:"

    set BARRA (math -s0 $PORCENTAJE / (math 100 / $SIZE))

    set_color -o $FRONT_COLOR
    for i in (seq 1 $BARRA)
        sleep $TIME_SLOW
        if test $i != "$BARRA"
            echo -n "$BODY"
        else
            echo -n "$HEAD"
        end
    end

    sleep $TIME_SLOW

    set_color $BACK_COLOR
    for i in (seq 1 (math $SIZE - $BARRA))
        sleep $TIME_FAST
        echo -n "$TO_FILL"
    end

    sleep $TIME_FAST
    set_color -o $FRONT_COLOR
    echo " $PORCENTAJE%"
    sleep $TIME_SLOW

end
