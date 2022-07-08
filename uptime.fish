function uptime --wraps='4h 4m' --description alias\ uptime\ uptime\ -p\ \|\ sed\ \'s/up\ //\;\ s/\ hour/h/\;\ s/,//\;\ s/\ minute/m/\;\ s/s//g\'
 command uptime -p | sed 's/up //;  s/ day/d/;s/ hour/h/; s/,//g; s/ minute/m/; s/s//g'; 
end
