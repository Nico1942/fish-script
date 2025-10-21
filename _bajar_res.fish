#!/usr/bin/env fish

if test (count $argv) -lt 2
    echo "Uso: bajar_res.fish <video> <1080|720>"
    exit 1
end

set input $argv[1]
set res $argv[2]

switch $res
    case 1080
        set scale 1920
    case 720
        set scale 1280
    case '*'
        echo "Resolución no válida. Usa 1080 o 720."
        exit 1
end

# Obtener ancho del video con ffprobe
set width (ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=p=0 "$input")

if test "$width" -le "$scale"
    echo "El video ($width px) ya es menor o igual que $res p. No se hace nada."
    exit 0
end

set output (string replace -r '\.(mp4|mkv|mov)$' "_$res" $input).mp4

# -c:a copy y sin -b:a 192k
ffmpeg -i "$input" -vf "scale=$scale:-2" -c:v libx265 -crf 28 -preset faster -c:a aac -b:a 192k "$output"
