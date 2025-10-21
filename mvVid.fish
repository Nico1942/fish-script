function mvVid --wraps='mv *.mp4 ./Videos/' --description 'alias mvVid mv *.mp4 ./Videos/'
	cd $(xdg-user-dir VIDEOS)
	mv *.mp4 ./Videos/ $argv

end
