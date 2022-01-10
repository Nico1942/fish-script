# Defined in - @ line 1
function miIP
  set IP (hostname -I | cut -d ' ' -f1); echo $IP $argv;
end
