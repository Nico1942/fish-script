function tcompras

	set todo_file "$HOME/Documentos/TODO.TXT/todo.txt"
	set serguir "true"
	set hoy (date "+%Y-%m-%d")
	echo "" >> $todo_file
	echo "Lista de compras (q) para salir:"
	echo "===== == ======= === ==== ======"
	echo ""

	while true
		read -P "A comprar: " compra
		if test "$compra" = "q"; or test -z $compra
			break
		end
		echo "$hoy Comprar: $compra +compra @almacen" >> $todo_file
	end
end