#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

install_plugins() {
	echo "installing pathogen"
	mkdir -p ~/.vim/autoload ~/.vim/bundle 
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	echo "installing airline"
	git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

	echo "installing rust vim"
	git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim

	echo "installing hybrid colors"
	mkdir -p ~/vim/colors
	cp $DIR/colors/hybrid.vim

	echo "installing surround"
	git clone https://tpope.io/vim/surround.git ~/.vim/bundle/surround
}

simlink() {
	echo "symlinking .vimrc"
	vimrc="$HOME/.vimrc"
	if [ -e "$vimrc" ]; then
	    if [ ! -L "$vimrc" ];  then
		echo "backing up ~/.vimrc"
		# not a symlink
		cp $HOME/.vimrc $/HOME.vimrc.bak
	    fi
	echo "deleting the ~/.vimrc"
	rm $HOME/.vimrc
	fi

	ln -s $DIR/vimrc $HOME/.vimrc
}

case $1 in
	link)
	simlink
	;;
	*)
	install_plugins
	simlink
	;;
esac


