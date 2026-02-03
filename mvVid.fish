function mvVid --wraps='mv *.mp4 ./Videos/' --description 'alias mvVid mv *.mp4 ./Videos/'
	cd $(xdg-user-dir DOWNLOAD)
	mv *.mp4 Videos/ $argv

end
