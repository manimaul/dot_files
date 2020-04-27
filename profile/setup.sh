#!/usr/bin/env bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -f ${HOME}/.bashrc ] 
    then
        echo "${HOME}/.bashrc already exists!"
	exit 1
    else
        echo "linking ~/.bashrc"
        ln -s "${dir}/bashrc.sh" "${HOME}/.bashrc"
fi

src='source ${HOME}/.bashrc'
file="${HOME}/.bash_profile"
if grep -q "$src" "${file}"
  then
    echo "~/.bashrc already sourced from ~/.bash_profile"
  else
    echo "touching ${file}"
    echo "${src}" >> "${file}"
    echo "done !"
fi
