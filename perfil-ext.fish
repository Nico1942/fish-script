#!/usr/bin/env fish

set option "good-looking" "minimal" "minimal2" "no"

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
        echo "Desactivando $(nombrar $ext)"
	gnome-extensions disable $ext
	sleep 0.05
    end
    echo "--- ||| ---"
end


function needed
  
  set -l installed (gnome-extensions list)

  if contains $argv $installed
    return true
  else
    return false
  end
end

function nombrar
   set -l nombre (echo $argv | sed 's/\@.*//g; s/-/ /g')
   echo $nombre
end


function goodLooking
    set -l extensions "arcmenu@arcmenu.com" "awesome-tiles@velitasali.com" "blur-my-shell@aunetx" "compiz-windows-effect@hermes83.github.com" "just-perfection-desktop@just-perfection" "pano@elhan.io" "user-theme@gnome-shell-extensions.gcampax.github.com"

    if [ needed $extesions ]
       for ext in $extensions
	  echo "Activando $(nombrar $ext)"
	  gnome-extensions enable $ext
	  sleep 0.05
       end
    end

end

function minimal
    set -l extensions "awesome-tiles@velitasali.com" "just-perfection-desktop@just-perfection" "pano@elhan.io"

    for ext in $extensions
	echo "Activando $(nombrar $ext)"
	gnome-extensions enable $ext
	sleep 0.05
    end
end

function minimal2
    set -l extensions "compiz-windows-effect@hermes83.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com"
    minimal
    for ext in $extensions
	echo "Activando $(nombrar $ext)"
	gnome-extensions enable $ext
	sleep 0.05
    end
end

if contains $argv $option
  disableAll
  switch "$argv"
    case "good-looking"
	    goodLooking
    case "minimal"
	minimal
    case "minimal2"
	minimal2
    case "no"
      disableAll
  end
else
  help
end
