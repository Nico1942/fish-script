function loop --description 'loop <count> <command>'

    # Compruebo que el segundo comando no tenga la propia función
    if not contains "loop" $argv
        for i in (seq 1 $argv[1])
            eval $argv[2..-1]
        end
    else
        echo "No se puede usar loop dentro de loop 😎"
    end
end
