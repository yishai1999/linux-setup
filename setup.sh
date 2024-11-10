#!/bin/bash

NAME="First Last"
EMAIL="user@domain.com"

# ------------------------------------------------------------>

SetupMisc() {
	sudo apt -y install curl mlocate unzip cmake
	sudo updatedb
}

SetupGit() {
    sudo apt -y install git

	cp .gitconfig ${HOME}/.gitconfig
	sed -i "s|@EMAIL@|${EMAIL}|g" ${HOME}/.gitconfig
	sed -i "s|@NAME@|${NAME}|g" ${HOME}/.gitconfig
}

SetupPython() {
	sudo apt -y install python3-pip ipython3
}

SetupZsh() {
	sudo apt -y install zsh fonts-powerline figlet
	pip3 install pygments

	git clone git@github.com:ohmyzsh/ohmyzsh.git ${HOME}/.oh-my-zsh
	git clone git@github.com:romkatv/powerlevel10k.git ${HOME}/.oh-my-zsh/custome/themes/powerlevel10k
	git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custome/plugins/zsh-syntax-highlighting
	git clone git@github.com:zsh-users/zsh-autosuggestions.git ${HOME}/.oh-my-zsh/custome/plugins/zsh-autosuggestions
	git clone git@github.com:conda-incubator/conda-zsh-completion.git ${HOME}/.oh-my-zsh/custome/plugins/conda-zsh-completion

	cp ${HOME}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME}/.zshrc
	sudo chsh -s `which zsh`
}

SetupAliasses() {
	cat history-search.sh >> ${HOME}/.bashrc
	cat aliases.sh >> ${HOME}/.bashrc
	cat aliases.sh >> ${HOME}/.zshrc
}

SetupConda() {
	echo -e "\n# Conda" >> ${HOME}/.zshrc
	echo -e "\n# Conda" >> ${HOME}/.bashrc
	echo ". ${HOME}/miniconda3/etc/profile.d/conda.sh" >> ${HOME}/.bashrc
	echo ". ${HOME}/miniconda3/etc/profile.d/conda.sh" >> ${HOME}/.zshrc
	echo ". ${HOME}/miniconda3/etc/profile.d/mamba.sh" >> ${HOME}/.bashrc
	echo ". ${HOME}/miniconda3/etc/profile.d/mamba.sh" >> ${HOME}/.zshrc
}

SetupVim() {
	sudo apt -y install vim
	cp vimrc ${HOME}/.vimrc
}

SetupTmux() {
	sudo apt -y install tmux
	cp .tmux.conf ${HOME}/.tmux.conf
}

SetupGstreamer() {
	sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
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
