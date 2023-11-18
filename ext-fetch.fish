function ext-fetch --description="Show all gnome extensions enabled."

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
    for i in $argv
        if test "$i" = --all
            set extensionsDisabled (gnome-extensions list --disabled | cut -d @ -f1 | sort | string lower)
            set numDisabled (count $extensionsDisabled)
            set allExtensions true
        end
        if test "$i" = --off
            set logo ""
            set logoWidth ""
            set space "  "
        end
    end

    set extensions (gnome-extensions list --enabled | cut -d @ -f 1 | sort)
    set numExtensions (count $extensions)

    # Setup title
    set logo[1] "$logo[1]$space\033[1;37mextensions [$numExtensions]"

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
        set logo[$index] "$logo[$index]$space\033[1;37mdisabled [$numDisabled]"
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
