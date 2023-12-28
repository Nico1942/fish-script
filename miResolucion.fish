function miResolucion
  xdpyinfo | awk '/dimensions:/ { print $2 }'
end
