function mvImg --wraps='mv {*.png, *.jpeg, *.jpg} ./img/' --description 'alias mvImg mv {*.png, *.jpeg, *.jpg} ./img/'
	cd $(xdg-user-dir DOWNLOAD)
	mv {*.png, *.jpeg, *.jpg} ./img/ $argv

end
