#!/usr/bin/env fish

# Uso: extract_audio.fish video.mp4

set input $argv[1]
set output (basename $input .mp4).mp3

if test -z "$input"
    echo "Uso: _video_extract_audio archivo_video.mp4"
    exit 1
end

ffmpeg -i "$input" -q:a 0 -map a "$output"
echo "Audio extraído a: $output"
