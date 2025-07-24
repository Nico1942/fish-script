#!/usr/bin/env fish

# Uso: slow_down_audio.fish archivo_entrada.mp3 velocidad_salida (ej: 0.5 para mitad de velocidad)

set input $argv[1]
set speed $argv[2]
set output (basename $input .mp3)_slowed.mp3

if test -z "$input" -o -z "$speed"
    echo "Uso: $argv[0] archivo_entrada.mp3 velocidad (ej. 0.5 para más lento)"
    exit 1
end

ffmpeg -i "$input" -filter:a "atempo=$speed" -vn "$output"
echo "Archivo generado: $output"
