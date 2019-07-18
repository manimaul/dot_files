#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

sudo apt update
sudo apt install -y curl

type lsvirtualenv >/dev/null 2>&1 || { 
  echo "installing virtualenvwrapper"
  sudo apt isntall -y python-pip
  pip install virtualenvwrapper
}


type nodejs >/dev/null 2>&1 || { 
  echo "installing node"
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  sudo apt install -y nodejs npm
  mkdir -p ~/.local/npm/bin
  npm config set prefix ~/.local/npm
}

type kubectl >/dev/null 2>&1 || { 
  echo "installing kubectl"
  curl -L -o ~/.local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
  chmod +x ~/.local/bin/kubectl
}

src="source ${DIR}/bashrc.sh"
file=${HOME}/.bashrc
if grep -q "$src" "$file"
  then
    echo "bashrc already set :)"
  else
    echo  ${src}>> $file
fi
