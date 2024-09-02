#!/usr/bin/env fish

set -l option "minimal" "minimal-look" "good-look" "cafe" "blue" "no"

set extensions (gnome-extensions list --enabled)

## Perfiles ##

set -l minimal "awesome-tiles@velitasali.com"\
	       "just-perfection-desktop@just-perfection"\
	       "pano@elhan.io"\
	       "tilingshell@ferrarodomenico.com"

set -l minimalLook $minimal\
		"background-logo@fedorahosted.org"
#		"compiz-windows-effect@hermes83.github.com"

set -l goodLook $minimalLook\
		"blur-my-shell@aunetx"\
		"custom-accent-colors@demiskp"\
		"user-theme@gnome-shell-extensions.gcampax.github.com"

set -l cafe $minimal\
	    "caffeine@patapon.info"

set -l blue "Bluetooth-Battery-Meter@maniacx.github.com"


## Auxiliares ##

function help
   echo "
   Opciones:
     minimal
     cafe
     blue
     minimal-look
     good-look
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
	  sleep 0.15
        end
    end
    echo "--- /|\ ---"
end

function needed
  
  set -l installed (gnome-extensions list)

  for i in $argv
    if not contains $i $installed
      echo "Falta extension "(nombrar $i)
  end
end
end



function main

       for ext in $argv
	  if not contains $ext $extensions
	    echo "Activando $(nombrar $ext)"
	    gnome-extensions enable $ext
	    sleep 0.15
          end
       end

       echo
       ext-fetch --off

end

if contains $argv $option
  switch "$argv"
    case "minimal"
	disableAll $minimal
	main $minimal
    case "cafe"
	disableAll $cafe
	main $cafe
    case "blue"
	main $blue
    case "minimal-look"
	disableAll $minimalLook
	main $minimalLook
    case "good-look"
        disableAll $goodLook
        main $goodLook
    case "no"
	disableAll
	echo "Todo desactivado. 🤓"
	echo
	ext-fetch --off
  end
else
  help
end
