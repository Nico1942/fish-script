#!/usr/bin/env fish

set configDir $HOME/.config/perfil-ext

mkdir -p $configDir
set configFile $configDir/perfil.conf

set option (awk -F ' = ' '/PERFILES/ { print $2 }' $configFile | string split ' ')
set optionOne (awk -F ' = ' '/SIMPLES/ { print $2 }' $configFile | string split ' ')

set extensions (gnome-extensions list --enabled)

## Auxiliares ##

function help
   echo "
Perfiles:"
   for i in $option
    echo "perfil: $i"
  end
  echo "
Una sola extensión:"
  for i in $optionOne
    echo "Ext: $i"
  end
  echo "
  --edit: Editar archivo de configuración."
end

function nombrar
   set -l nombre (gnome-extensions info $argv | awk '/Nombre: / { print $2 }')
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

function getExtensions
  awk -v perfil="$argv" -F ' = ' '$1 == perfil { print $2 }' $configFile | string split ' '
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
  echo "Perfil: $argv"
  set extensionPerfil (getExtensions $argv)
  echo "Extensiones: $extensionPerfil"
  disableAll $extensionPerfil
  main $extensionPerfil
else if contains $argv $optionOne
  echo "Perfil: $argv"
  set extensionPerfil (getExtensions $argv)
  main $extensionPerfil
else if contains -- "--edit" $argv
  nvim $configFile
else
  help
end
