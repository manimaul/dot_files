#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [[ -h "$SOURCE" ]]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ ${SOURCE} != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

install_plugin() {
  plugin_repo=$1
  plugin_dir=$2
  if [[ ! -d ${plugin_dir} ]]; then
    echo "installing $1"
    git clone --depth=1 ${plugin_repo} ${plugin_dir}
  fi
}

install_plugins() {
  if [[ ! -d ~/.vim/autoload/pathogen.vim ]]; then
    echo "installing pathogen"
    mkdir -p ~/.vim/autoload ~/.vim/bundle 
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  fi

  install_plugin https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
  install_plugin https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
  install_plugin https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive.vim
  install_plugin git://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter.vim
  install_plugin https://tpope.io/vim/surround.git ~/.vim/bundle/surround.vim
  install_plugin https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic.vim
  install_plugin https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar.vim
  install_plugin https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree.vim
  install_plugin https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
  install_plugin https://github.com/udalov/kotlin-vim ~/.vim/bundle/kotlin-vim
}

dependencies() {
  if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt-get install -y vim-gtk3 cmake build-essential python3-dev ctags default-jdk-headless
  fi
  if [[ "$OSTYPE" == darwin* ]]; then
    packages=(cmake ctags)
    for package in ${packages[@]}; do
      if brew ls --versions $package > /dev/null; then
        echo "${package} already installed"
      else
        echo "installing ${package}"
        brew install ${package}
      fi
    done 
  fi
}

install_ycm() {
  ycm_dir="${HOME}/.vim/bundle/ycm.vim"
  if [[ ! -d ${ycm_dir} ]]; then
    echo "installing $1"
    git clone --depth=1 https://github.com/Valloric/YouCompleteMe.git ${ycm_dir}
    pushd ${ycm_dir}
    git submodule update --init --recursive
    python3 install.py --rust-completer --clang-completer --java-completer
    popd
  fi
}

colors() {
  echo "installing hybrid colors"
  mkdir -p ~/.vim/colors
  cp $DIR/colors/hybrid.vim ~/.vim/colors/hybrid.vim
}

simlink() {
	echo "symlinking .vimrc"
	vim_rc="${HOME}/.vimrc"
	if [[ -e "$vim_rc" || -L "$vim_rc" ]]; then
	    if [[ ! -L "$vim_rc" ]];  then
		echo "backing up ~/.vimrc"
		# not a symlink
		cp ${HOME}/.vimrc ${HOME}.vimrc.bak
	    fi
	echo "deleting the ~/.vimrc"
	rm ${HOME}/.vimrc
	fi

  if [[ -e "${HOME}/.ideavimrc" || -L "${HOME}/.ideavimrc" ]]; then
    echo "backing up ~/.ideavimrc"
    cp ${HOME}/.ideavimrc ${HOME}/ideavimrc.bak
    rm ${HOME}/.ideavimrc
  fi

	ln -s ${DIR}/vimrc ${HOME}/.vimrc
	ln -s ${DIR}/ideavimrc ${HOME}/.ideavimrc
}

usage() {
	echo "link|colors|all|ycm|plugins|help"
}

case $1 in
"link")
  simlink
;;
"colors")
  colors
;;
"ycm")
  dependencies
  install_ycm
;;
"plugins")
  dependencies
  install_plugins
;;
"all")
  dependencies
  install_plugins
  install_ycm
  simlink
  colors
;;
*)
  usage
;;
esac

