#!/bin/bash

	vim_config() {
		if [ -d ~/.vim/bundle/Vundle.vim ]; then
			echo 'Vundle already exists'
		else 
			echo 'Cloning vundle.'
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		fi
	
		echo 'Linking vim files'
		ln -s /home/$ME/dotfiles/vimrc /home/$ME/.vimrc

		#installing plugins

		vim +PluginInstall +qall
	}

vim_config
