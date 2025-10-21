function tedit --wraps='cd ~/Documentos/TODO.TXT/;n todo.txt' --description 'Editar todo.txt con editor de texto'
  subl $HOME/Documentos/TODO.TXT/todo.txt $argv
end
