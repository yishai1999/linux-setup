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
	sudo apt -y install software-properties-common
}

GetTmux() {
	sudo apt -y install tmux
}

# Get git
GetGit() {
        sudo apt -y install git

	echo -e "[user]" > ${GIT_CONFIG}
	echo -e "\n\temail = ${EMAIL}" >> ${GIT_CONFIG}
	echo -e "\n\tname = ${NAME}" >> ${GIT_CONFIG}
	echo -e "\n[credential]" >> ${GIT_CONFIG}
	echo -e "\n\thelper = store" >> ${GIT_CONFIG}

	echo -e "https://${GITHUB_USERNAME}:${GITHUB_PASSWORD}@github.com" > ${GIT_CREDENTIALS}
	echo -e "\nhttps://${GITLAB_USERNAME}:${GITLAB_PASSWORD}@gitlab.com" >> ${GIT_CREDENTIALS}
}

# Get zsh + oh-my-zsh
GetZsh() {
	sudo apt -y install zsh
	git clone https://github.com/ohmyzsh/ohmyzsh.git ${HOME}/.oh-my-zsh
	cp ${SETUP_DIR}/zshrc ${HOME}/.zshrc
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
}

# Get gdb
GetGdb() {
	sudo apt -y install gdb
}

Init
GetTmux
GetGit
GetZsh
GetGstreamer
GetCMake
GetVim
GetGdb
