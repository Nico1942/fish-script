function ext-fetch --description="Show all gnome extensions enabled."
    set bold "\033[1;37m" 

    # Space between logo and text
    set space "     "

    set logo[1] "⠀⠀⠀⠀⠀⣤⣄⠀⢀⣴⣶⣶"
    set logo[2] "⠀⠀⣾⣆⠘⣿⡏⠀⣿⣿⣿⠏"
    set logo[3] "⣿⡆⠙⠃⠀⣈⣀⣀⡙⠋⠁⠀"
    set logo[4] "⠈⢁⣤⣾⣿⣿⣿⣿⣿⣷⠀⠀"
    set logo[5] "⠀⣾⣿⣿⣿⣿⣿⣿⠿⠃⠀⠀"
    set logo[6] "⠀⢿⣿⣿⣿⡿⠋⠁⣀⣀⠀⠀"
    set logo[7] "⠀⠈⢿⣿⣿⣄⣀⣼⣿⡿⠁⠀"
    set logo[8] "⠀⠀⠀⠉⠛⠿⠿⠿⠛⠁⠀⠀"
    set logoWidth "            "

    set allExtensions false

    if contains -- --all $argv
        set extensionsDisabled (gnome-extensions list --disabled | cut -d @ -f1 | sort | string lower)
        set numDisabled (count $extensionsDisabled)
        set allExtensions true
    end
    if contains -- --off $argv
        set logo ""
        set logoWidth ""
        set space "  "
    end
    if contains -- --space $argv
	set -l index (contains -i -- --space $argv)
	set -l index (math $index + 1)
	for i in (seq $argv[$index])
	    set space $space " "
	end
   end

    set extensions (gnome-extensions list --enabled | cut -d @ -f 1 | sort)
    set numExtensions (count $extensions)

    # Setup title
    set logo[1] "$logo[1]$space$bold""extensions [$numExtensions]"

    set logoHeight (count $logo)
    set index 2

    for i in $extensions
        if test $index -le $logoHeight
            set logo[$index] "$logo[$index]$space• $i"
            set index (math $index + 1)
        else
            set logo[$index] "$logoWidth$space• $i"
            set index (math $index + 1)
        end
    end

    if test "$allExtensions" = true
        set index (math $index + 1)
	set logo[$index] "$logo[$index]$(if test $index -gt $logoHeight; echo $logoWidth; end)$space$bold""disabled [$numDisabled]"
        set index (math $index + 1)

        for i in $extensionsDisabled
            if test $index -le $logoHeight
                set logo[$index] "$logo[$index]$space• $i"
                set index (math $index + 1)
            else
                set logo[$index] "$logoWidth$space• $i"
                set index (math $index + 1)
            end
        end
    end

    if test $index -le $logoHeight
        set logoWidth ""
    end

    set logo[$index] "$logo[$index]$logoWidth$space• 󰊬 󰊬 󰊬 •"

    for i in $logo
        sleep 0.001
        echo -e $i | sed 's/-/ /g' | string shorten -m 50 | lolcat -b
    end

end
