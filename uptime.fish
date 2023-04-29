function uptime --wraps='4h 4m' --description 'A minimal uptime. Ex.: 1h 2m 3m' 
 command uptime -p | sed 's/up //;  s/ day/d/;s/ hour/h/; s/,//g; s/ minute/m/; s/s//g'; 
end
