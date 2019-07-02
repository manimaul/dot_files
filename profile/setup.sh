#!/usr/bin/env bash

echo "installing virtualenvwrapper"
pip install virtualenvwrapper

echo "installing kubectl"
curl -LO -o ~/.local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ~/.local/bin/kubectl

echo "source ~/source/manimaul/dot_files/profile/bashrc.sh" >> ~/.bashrc
