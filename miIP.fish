# Defined in - @ line 1
function miIP
  hostname -I | cut -d ' ' -f1
end
