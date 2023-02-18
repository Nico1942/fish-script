function ext-fetch-tiny --description="Show all gnome extensions enabled in a simple way."

  # Space between logo and text
  set extensions (gnome-extensions list --enabled | cut -d @ -f 1 | sort)
  set totalExtensions (count $extensions)
  # set all (gnome-extensions list | cut -d @ -f1)
  # set allnro (count $all)

  # Setup title
  echo -e "\033[1;37m  extensions [$totalExtensions]"
  echo -e '────────────────────────────'
  echo $extensions | sed 's/ /\n • /g; s/^/ • /'
  echo -e '────────────────────    ─'

end

