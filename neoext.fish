function neoext

  set space "      "
  set logo[1] " ⠀⠀⠀⠀⠀⠀⢀⣤⡄⠀⢀⣤⣶⣶⣦$space\033[1;37mextensions"
  set logo[2] " ⠀⠀⠀⣴⣶⠀⢺⣿⡇⠀⣾⣿⣿⣿⠃$space\033[1;37m⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺"
  set logo[3] " ⢠⣶⡄⠹⠿⠀⠈⠋⠀⠀⠻⠿⠛⠁⠀"
  set logo[4] " ⠈⠻⠇⠀⣠⣤⣶⣶⣾⣷⣶⣦⡀⠀⠀"
  set logo[5] " ⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀"
  set logo[6] " ⠀⠀⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀"
  set logo[7] " ⠀⠀⢿⣿⣿⣿⡿⠋⠁⢀⣠⣤⡀⠀⠀"
  set logo[8] " ⠀⠀⠀⠻⣿⣿⣷⣄⣀⣼⣿⣿⠇⠀⠀"
  set logo[9] " ⠀⠀⠀⠀⠈⠛⠿⠿⣿⠿⠛⠁⠀⠀⠀"
  set logo[10] "                "
  set space2 "                "

  set extensions (gnome-extensions list --enabled | cut -d @ -f 1 | sort)
  set total (count $extensions)

  set num 3

  for i in $extensions
    if test $num -le 10
      set logo[$num] "$logo[$num]$space$i"
      set num (math $num + 1)
    else
      set logo[$num] "$space2$space$i"
      set num (math $num + 1)
    end
  end

  set logo[1] "$logo[1] ($total)" 

  echo ""; echo ""

  for i in $logo
    sleep 0.001
    echo -e $i | lolcat -b
  end

end

