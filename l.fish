# Defined via `source`
function l --wraps=ls --wraps=exa --description 'alias l exa'
  eza $argv; 
end
