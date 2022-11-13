#!/bin/bash

# User variables
NAME="Yishai Jaffe"
EMAIL=yishai1999@gmail.com

GITHUB_USERNAME=yishai1999
GITHUB_PASSWORD=Yishai131999
GITLAB_USERNAME=yishai1999
GITLAB_PASSWORD=Yishai13

GIT_CONFIG=${HOME}/.gitconfig
GIT_CREDENTIALS=${HOME}/.git-credentials

# ------------------------------------------------------------>

SETUP_DIR=$(dirname "$0")

# Init
Init() {
	sudo apt -y install curl
	sudo apt -y install mlocate
	sudo updatedb
}

GetPython() {
	sudo apt -y install python3
	sudo apt -y install python3-pip
	python3 -m pip install pygments
}

GetTmux() {
	sudo apt -y install tmux
}

# Get git
GetGit() {
    sudo apt -y install git

	cp .gitconfig ${GIT_CONFIG}
	sed -i "s|@EMAIL@|${EMAIL}|g" ${GIT_CONFIG}
	sed -i "s|@NAME@|${NAME}|g" ${GIT_CONFIG}

	echo -e "https://${GITHUB_USERNAME}:${GITHUB_PASSWORD}@github.com" > ${GIT_CREDENTIALS}
	echo -e "\nhttps://${GITLAB_USERNAME}:${GITLAB_PASSWORD}@gitlab.com" >> ${GIT_CREDENTIALS}
}

# Get zsh + oh-my-zsh
GetAliasses() {
	cat history-search.sh >> ${HOME}/.bashrc
	cat bashrc >> ${HOME}/.bashrc
	cat bashrc >> ${HOME}/.zshrc
	cat zshrc >> ${HOME}/.zshrc
}

# Get zsh + oh-my-zsh
GetZsh() {
	sudo apt -y install zsh
	git clone https://github.com/yishai1999/ohmyzsh.git ${HOME}/.oh-my-zsh --recursive --branch plugins
	cp ${HOME}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME}/.zshrc
	sudo chsh -s /usr/bin/zsh
}

# Get gstreamer
GetGstreamer() {
	sudo apt -y install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
}

# Get cmake
GetCMake() {
	sudo apt -y install cmake
}

# Get vim
GetVim() {
	sudo apt -y install vim
	cp vimrc ${HOME}/.vimrc
}

# Get gdb
GetGdb() {
	sudo apt -y install gdb
}

Init
GetPython
GetTmux
GetGit
GetZsh
GetGstreamer
GetCMake
GetVim
GetGdb
