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
	cp .vimrc ${HOME}/.vimrc
}

SetupTmux() {
	sudo apt -y install tmux
	git clone git@github.com:gpakosz/.tmux.git ${HOME}/.tmux
	ln -s -f ${HOME}/.tmux/.tmux.conf ${HOME}/.tmux.conf
	ln -s -f ${HOME}/.tmux/.tmux.conf.local ${HOME}/.tmux.conf.local
	cp .tmux.conf.local ${HOME}/.tmux.conf.local
}

SetupMisc
SetupGit
SetupPython
SetupZsh
SetupAliasses
SetupConda
SetupVim
SetupTmux
