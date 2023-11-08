# Defined in - @ line 1
function miIPqr
  if test "$argv[1]" = ""
    read -P "Debes ingresar número de puerto: " PUERTO
    set argv[1] $PUERTO
  end
  set IP (hostname -I | cut -d ' ' -f1)
   qrencode -t ansiutf8 (echo http://$IP:$argv[1]/index.html) 
   #feh host_index.png
   #rm host_index.png
end
