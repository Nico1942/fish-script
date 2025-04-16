#!/usr/bin/env fish

set option "basic" "minimal" "minimal-look" "good-look" "cafe" "blue" "mouse" "no"

set extensions (gnome-extensions list --enabled)

## Perfiles ##

set -l basic "tilingshell@ferrarodomenico.com"\
            "just-perfection-desktop@just-perfection"
            # "awesome-tiles@velitasali.com"\

set -l minimal $basic\
	       "printers@linux-man.org"\
           "clipboard-indicator@tudmotu.com"
           "gsconnect@andyholmes.github.io"
           #"pano@elhan.io"\

set -l minimalLook $minimal\
    "burn-my-windows@schneegans.github.com"\
    "panel-corners@aunetx"

set -l goodLook $minimalLook\
    "blur-my-shell@aunetx"\
    "compiz-windows-effect@hermes83.github.com"\
    "openbar@neuromorph"

### Una sola extensión

set -l cafe "caffeine@patapon.info"

set -l blue "Bluetooth-Battery-Meter@maniacx.github.com"

set -l mouse "tilingshell@ferrarodomenico.com"

## Auxiliares ##

function help
   echo "
   Opciones:"
   for i in $option
    echo "Perfil: $i"
  end
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
    case "basic"
        disableAll $basic
        main $basic
    case "minimal"
	   disableAll $minimal
	   main $minimal
    case "minimal-look"
	   disableAll $minimalLook
	   main $minimalLook
    case "good-look"
        disableAll $goodLook
        main $goodLook
    case "cafe"
	   main $cafe
    case "blue"
	   main $blue
    case "mouse"
	   main $mouse
    case "no"
	   disableAll
	   echo "Todo desactivado. 🤓"
	   echo
	   ext-fetch --off
  end
else
  help
end
