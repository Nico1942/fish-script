function ext-fetch --description="Show all gnome extensions enabled."

  # Space between logo and text
  set space "      "

  set logo[1]   " ⠀⠀⠀⠀⠀⠀⢀⣤⡄⠀⢀⣤⣶⣶⣦"
  set logo[2]   " ⠀⠀⠀⣴⣶⠀⢺⣿⡇⠀⣾⣿⣿⣿⠃"
  set logo[3]   " ⢠⣶⡄⠹⠿⠀⠈⠋⠀⠀⠻⠿⠛⠁⠀"
  set logo[4]   " ⠈⠻⠇⠀⣠⣤⣶⣶⣾⣷⣶⣦⡀⠀⠀"
  set logo[5]   " ⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀"
  set logo[6]   " ⠀⠀⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀"
  set logo[7]   " ⠀⠀⢿⣿⣿⣿⡿⠋⠁⢀⣠⣤⡀⠀⠀"
  set logo[8]   " ⠀⠀⠀⠻⣿⣿⣷⣄⣀⣼⣿⣿⠇⠀⠀"
  set logo[9]   " ⠀⠀⠀⠀⠈⠛⠿⠿⣿⠿⠛⠁⠀⠀⠀"
  set logo[10]  "                "
  set logoWidth "                "

  set extensions (gnome-extensions list --enabled | cut -d @ -f 1 | sort)
  set totalExtensions (count $extensions)
 # set all (gnome-extensions list | cut -d @ -f1)
 # set allnro (count $all)

  # Setup title
  set logo[1] "$logo[1]$space\033[1;37mextensions [$totalExtensions]" 
  set logo[2] "$logo[2]$space\b\b\033[1;37m├──────────────────────────────┤"

  set logoHeight (count $logo)
  set index 3

  for i in $extensions
    if test $index -le $logoHeight
      set logo[$index] "$logo[$index]$space• $i"
      set index (math $index + 1)
    else
      set logo[$index] "$logoWidth$space• $i"
      set index (math $index + 1)
    end
  end


  echo ""; echo ""
  echo -e $logoWidth$space\b\b"┌──────────────────────────────┐" | lolcat -b

  for i in $logo
    sleep 0.001
    if test "$i" = "$logo[2]"
      echo -e $i | lolcat -b
      continue
    end
    echo -e $i | sed 's/-/ /g' | string shorten -m 50 | lolcat -b
  end

  echo -e $logoWidth$space\b\b"└──────────────────────    ─┘" | lolcat -b
end

