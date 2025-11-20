function _limpiarTODO
    if test -e TODO.txt
        grep -F '[x]' TODO.txt >> DONE.txt 
        sed -e '/\[x\]/d' -i TODO.txt
        echo "TODO limpiado"
    else
        echo "No hay archivos TODO."
    end
end
