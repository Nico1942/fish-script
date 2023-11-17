function capitalize
    echo $argv | sed 's/[^_-]*/\u&/g'
end
