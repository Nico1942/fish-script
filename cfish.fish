function cfish --wraps='cd ~/.config/fish/' --description 'alias cfish cd ~/.config/fish/'
  if contains -- -u $argv
	cd ~/bin/fish-script/
  else
  	cd ~/.config/fish/functions/ $argv; 
  end
end
