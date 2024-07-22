#!/usr/bin/env fish

set -l option "good-looking" "minimal" "minimal2" "no"

set extensions (gnome-extensions list --enabled)

## Perfiles ##

set -l goodLook "awesome-tiles@velitasali.com"\
		"blur-my-shell@aunetx"\
		"compiz-windows-effect@hermes83.github.com"\
		"custom-accent-colors@demiskp"\
		"just-perfection-desktop@just-perfection"\
		"pano@elhan.io"\
		"user-theme@gnome-shell-extensions.gcampax.github.com"

set -l minimal "awesome-tiles@velitasali.com" "just-perfection-desktop@just-perfection" "pano@elhan.io" "tilingshell@ferrarodomenico.com"

set -l minimal2 "awesome-tiles@velitasali.com"\
	        "just-perfection-desktop@just-perfection"\
		"pano@elhan.io"\
		"compiz-windows-effect@hermes83.github.com"\
		"user-theme@gnome-shell-extensions.gcampax.github.com"


## Auxiliares ##

function help
   echo "
   Opciones:
     good-looking
     minimal
     minimal2
     no"
end

function nombrar
   set -l nombre (gnome-extensions info $argv | grep "Nombre: " | sed 's/Nombre: //')
   echo $nombre
end

function disableAll 

    for i in $extensions
	if not contains $i $argv
          echo "Desactivando $(nombrar $i)"
	  gnome-extensions disable $i
	  sleep 0.05
        end
    end
    echo "--- /|\ ---"
end

function needed
  
  set -l installed (gnome-extensions list)

  for i in $argv
    if not contains $argv $installed
      echo "Falta extension "(nombrar $i)
  end
end
end



function main

       for ext in $argv
	  if not contains $ext $extensions
	    echo "Activando $(nombrar $ext)"
	    gnome-extensions enable $ext
	    sleep 0.05
          end
       end

       echo
       ext-fetch --off

end

if contains $argv $option
  switch "$argv"
    case "good-looking"
	    disableAll $goodLook
	    main $goodLook
    case "minimal"
	disableAll $minimal
	main $minimal
    case "minimal2"
	disableAll $minimal2
	main $minimal2
    case "no"
      disableAll
      echo "Todo desactivado. 🤓"
      echo
      ext-fetch --off
  end
else
  help
end
