function ext-fetch-tiny --description="Show all gnome extensions enabled in a simple way."

  # Cuento las extensiones activas, le saco todo lo que está después del @ y lo ordeno 
  set extensions (gnome-extensions list --enabled | sed 's/@.*$//g' | sort)
  set totalExtensions (count $extensions)
  # set all (gnome-extensions list | cut -d @ -f1)
  # set allnro (count $all)

  # Setup title
  echo -e "\033[1;37m • extensions [$totalExtensions]\033[1;0m"
  echo $extensions | sed 's/ /\n • /g; s/^/ • /; s/-/ /g'
  echo -e '                 ─    ─'

end

