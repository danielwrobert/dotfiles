#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doUpdate() {
	rsync --exclude ".git/" \
		--exclude "init" \
		--exclude ".DS_Store" \
		--exclude ".macos" \
		--exclude ".vimrc_remote" \
		--exclude "bootstrap.sh" \
		--exclude "sync.sh" \
		--exclude "brew.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doUpdate;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doUpdate;
	fi;
fi;
unset doUpdate;
