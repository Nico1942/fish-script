#!/usr/bin/env fish

set -l option "good-looking" "minimal" "minimal2" "no"

## Perfiles ##

set -l goodLook "awesome-tiles@velitasali.com"\
		"blur-my-shell@aunetx"\
		"compiz-windows-effect@hermes83.github.com"\
		"custom-accent-colors@demiskp"\
		"just-perfection-desktop@just-perfection"\
		"pano@elhan.io"\
		"user-theme@gnome-shell-extensions.gcampax.github.com"

set -l minimal "awesome-tiles@velitasali.com" "just-perfection-desktop@just-perfection" "pano@elhan.io"

set -l minimal2 "awesome-tiles@velitasali.com"\
	        "just-perfection-desktop@just-perfection"\
		"pano@elhan.io"\
		"compiz-windows-effect@hermes83.github.com"\
		"user-theme@gnome-shell-extensions.gcampax.github.com"


function help
   echo "
   Opciones:
     good-looking
     minimal
     no"
end

function nombrar
   set -l nombre (echo $argv | sed 's/\@.*//g; s/-/ /g')
   echo $nombre
end

function disableAll 
    set -l extensions (gnome-extensions list --enabled)

    for ext in $extensions
        echo "Desactivando $(nombrar $ext)"
	gnome-extensions disable $ext
	sleep 0.05
    end
    echo "--- /|\ ---"
end

function needed
  
  set -l installed (gnome-extensions list)

  if contains $argv $installed
    return true
  else
    return false
  end
end



function main

       for ext in $argv
	  echo "Activando $(nombrar $ext)"
	  gnome-extensions enable $ext
	  sleep 0.05
       end

end

if contains $argv $option
  disableAll
  switch "$argv"
    case "good-looking"
	    main $goodLook
    case "minimal"
	main $minimal
    case "minimal2"
	main $minimal2
    case "no"
      echo "Todo desactivado. 🤓"
  end
else
  help
end
