#!/usr/bin/env fish

set option "good-looking" "minimal" "no"

function help
   echo "
   Opciones:
     good-looking
     minimal
     no"
end

function disableAll 
    set -l extensions (gnome-extensions list --enabled)

    for ext in $extensions
	gnome-extensions disable $ext
    end
end


function needed
  
  set -l installed (gnome-extensions list)

  if contains $argv $installed
    return true
  else
    return false
    echo " Faltan extensiones.
 Necesarias: $argv"
  end
end


function goodLooking
    set -l extensions "arcmenu@arcmenu.com" "awesome-tiles@velitasali.com" "blur-my-shell@aunetx" "compiz-windows-effect@hermes83.github.com" "just-perfection-desktop@just-perfection" "pano@elhan.io"

    if [ needed $extesions ]
       for ext in $extensions
	  gnome-extensions enable $ext
       end
    end

end

function minimal
    set -l extensions "awesome-tiles@velitasali.com" "just-perfection-desktop@just-perfection" "pano@elhan.io"

    for ext in $extensions
	gnome-extensions enable $ext
    end
end


if contains $argv $option
  disableAll
  switch "$argv"
    case "good-looking"
	    goodLooking
    case "minimal"
	minimal
    case "no"
      disableAll
  end
else
  help
end
