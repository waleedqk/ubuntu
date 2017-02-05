default: git

clean:
	find . -type f -name '*~' -delete

pull:
	git pull --all

git: clean
	git add *
	git commit -m "Commit"
	git push -u origin master
