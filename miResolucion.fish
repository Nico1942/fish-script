function miResolucion
set resolucion (xdpyinfo | awk '/dimensions:/ { print $2 }')
echo $resolucion
end
