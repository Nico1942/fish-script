function ordenarApps --description 'Ordena alfabéticamente las app de gnome.'
  set Estado (gnome-extensions info AlphabeticalAppGrid@stuarthayhurst | grep Estado | sed -e 's/.*Estado: //')
  if  [ "$Estado" != "DISABLED" ]
    gnome-extensions enable AlphabeticalAppGrid@stuarthayhurst
    sleep 2
    notify-send "Apps ordenadas"
    gnome-extensions disable AlphabeticalAppGrid@stuarthayhurst
  else
    gnome-extensions disable AlphabeticalAppGrid@stuarthayhurst
  end
end
