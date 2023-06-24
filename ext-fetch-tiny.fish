function ext-fetch-tiny --description="Show all gnome extensions enabled in a simple way."

  # Cuento las extensiones activas, le saco todo lo que está después del @ y lo ordeno 
  set extensions (gnome-extensions list --enabled | sed 's/@.*$//g' | sort)
  set totalExtensions (count $extensions)

  # Setup title
  if contains -- --all $argv
  	set all (gnome-extensions list | sed 's/@.*$//g; s/\w/\l&/g' | sort)
	set allnro (count $all)
  	echo
  	echo -e "\033[1;37m  installed [$allnro]\033[1;0m"
  	echo $all | sed 's/ /\n  • /g; s/^/  • /; s/-/ /g'
  end

  echo
  echo -e "\033[1;37m  extensions [$totalExtensions]\033[1;0m"
  echo $extensions | sed 's/ /\n  • /g; s/^/  • /; s/-/ /g'
  echo -e '                 ─    ─'

end

