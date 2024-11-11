# Defined in - @ line 1
function actualizar --wraps='run0 dnf update' --description 'alias actualizar=sudo dnf update'
  run0 dnf update $argv;
end
