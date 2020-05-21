#!/bin/bash

# User variables
NAME="Yishai Jaffe"
EMAIL=yishai1999@gmail.com

GITHUB_USERNAME=user
GITHUB_EMAIL=email
GITHUB_PASSWORD=pass
GITLAB_USERNAME=user
GITLAB_EMAIL=email
GITLAB_PASSWORD=pass

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
	echo -e "[user]\n\temail = ${EMAIL}\n\tname = ${NAME}" > ${HOME}/.gitconfig
}

# Get zsh + oh-my-zsh
GetZsh() {
	sudo apt -y install zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp ${SETUP_DIR}/zshrc ${HOME}/.zshrc
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
