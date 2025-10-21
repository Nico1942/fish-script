#!/usr/bin/env fish

set video $argv[1]
set salida (echo "$video" | cut -d. -f 1)

ffmpeg -i "$video" -c:v libx264 -pix_fmt yuv420p -profile:v high -level 4.1 -c:a aac -b:a 192k "~/$salida_fix.mp4"
