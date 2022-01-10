# Defined in - @ line 1
function actualizar --wraps='sudo dnf update' --description 'alias actualizar=sudo dnf update'
  sudo dnf update $argv;
end
