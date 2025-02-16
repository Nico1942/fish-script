function ext-fetch --description="Show all gnome extensions enabled."

    set bold (set_color -o white)
    set white (set_color white)
    set red (set_color red)
    set green (set_color green)
    set blue (set_color blue)
    set normal (set_color normal)

    set active ""
    set inactive ""

    # Space between logo and text
    set space "    "

    set logo[1] $white" ⠀⠀⠀⠀⠀⣤⣄⠀⢀⣴⣶⣶"$normal
    set logo[2] $white" ⠀⠀⣾⣆⠘⣿⡏⠀⣿⣿⣿⠏"$normal
    set logo[3] $white" ⣿⡆⠙⠃⠀⣈⣀⣀⡙⠋⠁⠀"$normal
    set logo[4] $white" ⠈⢁⣤⣾⣿⣿⣿⣿⣿⣷⠀⠀"$normal
    set logo[5] $white" ⠀⣾⣿⣿⣿⣿⣿⣿⠿⠃⠀⠀"$normal
    set logo[6] $white" ⠀⢿⣿⣿⣿⡿⠋⠁⣀⣀⠀⠀"$normal
    set logo[7] $white" ⠀⠈⢿⣿⣿⣄⣀⣼⣿⡿⠁⠀"$normal
    set logo[8] $white" ⠀⠀⠀⠉⠛⠿⠿⠿⠛⠁⠀⠀"$normal
    set logoWidth "             "$normal

    set allExtensions false

    if contains -- --all $argv
        set extensionsDisabled (gnome-extensions list -d --disabled | awk -F ': ' '/ Nombre: / {print $2}' | sort | string lower)
        set numDisabled (count $extensionsDisabled)
        set allExtensions true
    end
    if contains -- --off $argv
        set logo ""
        set logoWidth ""
        set space ""
    end
    if contains -- --space $argv
	set -l index (contains -i -- --space $argv)
	set -l index (math $index + 1)
	for i in (seq $argv[$index])
	    set space $space " "
	end
   end

   #    set extensions (gnome-extensions list --enabled | cut -d @ -f 1 | sort)
    set extensions (gnome-extensions list -d --enabled | awk -F ': ' '/ Nombre: / {print $2}' | sort | string lower)
    set numExtensions (count $extensions)

    # Setup title
    set logo[1] "$logo[1]$space$bold""extensions [$numExtensions]"$normal

    set logoHeight (count $logo)
    set index 2

    for i in $extensions
        if test $index -le $logoHeight
            set logo[$index] "$logo[$index]$space$green$active $white$i"
            set index (math $index + 1)
        else
            set logo[$index] "$logoWidth$space$green$active $white$i"
            set index (math $index + 1)
        end
    end

    if test "$allExtensions" = true
        set index (math $index + 1)
	set logo[$index] "$logo[$index]$(if test $index -gt $logoHeight; echo $logoWidth; end)$space$bold""disabled [$numDisabled]"$normal
        set index (math $index + 1)

        for i in $extensionsDisabled
            if test $index -le $logoHeight
                set logo[$index] "$logo[$index]$space$red$inactive $white$i"
                set index (math $index + 1)
            else
                set logo[$index] "$logoWidth$space$red$inactive $white$i"
                set index (math $index + 1)
            end
        end
    end

    if test $index -le $logoHeight
        set logoWidth ""
    end

    set logo[$index] "$logo[$index]$logoWidth$space$bold$white• $red󰊬 $green󰊬 $blue󰊬 $white•"$normal

    for i in $logo
        sleep 0.001
        echo $i
    end

end
