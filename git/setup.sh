#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [[ -h "$SOURCE" ]]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ ${SOURCE} != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"


sim_link() {
  echo "sym linking git config"
  git_config="${HOME}/.gitconfig"
  if [[ -e "${git_config}" || -L "$git_config" ]];  then
    if [[ ! -L "$git_config" ]];  then
      echo "backing up ~/.gitconfig"
      cp ${HOME}/.gitconfig ${HOME}/.gitconfig.bak
    fi
    echo "deleting the ~/.gitconfig"
    rm ${HOME}/.gitconfig
  fi

  if [[ -e ${HOME}/.gitignore_global ]]; then
    rm ${HOME}/.gitignore_global
  fi
  ln -s ${DIR}/gitconfig ${HOME}/.gitconfig
  ln -s ${DIR}/gitignore_global ${HOME}/.gitignore_global
}

usage() {
	echo "link|help"
}

case $1 in
"link")
	sim_link
;;
*)
	usage
;;
esac


