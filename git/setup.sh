#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"


simlink() {
	echo "symlinking gitconfig"
	gitconfig="$HOME/.gitconfig"
	if [[ -e "$gitconfig" || -L "$gitconfig" ]]; then
	    if [ ! -L "$gitconfig" ];  then
		echo "backing up ~/.gitconfig"
		# not a symlink
		cp $HOME/.gitconfig $/HOME.gitconfig.bak
	    fi
	echo "deleting the ~/.gitconfig"
	rm $HOME/.gitconfig
	rm $HOME/.gitignore_global
	fi

	ln -s $DIR/gitconfig $HOME/.gitconfig
	ln -s $DIR/gitignore_global $HOME/.gitignore_global
}

usage() {
	echo "link|help"
}

case $1 in
"link")
	simlink
;;
*)
	usage
;;
esac


