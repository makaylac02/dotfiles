#!/bin/bash

bash_config() {
	echo 'Linking bash: '
	ln -s /home/$ME/dotfiles/bashrc /home/$ME/.bashrc

	echo 'Applying bash: '
	bash -c 'source ~/.bashrc'

}
bash_config
	
