#!/bin/bash


	if [ -d ~/.ssh ]; then
		echo 'SSH folder exists'
	else 
		echo 'Creating SSH folder'
		mkdir ~/.ssh
	fi

	echo 'File linking: '
	ln -s /home/$ME/dotfiles/sshfiles/config /home/$ME/.ssh/config
	ln -s /home/$ME/dotfiles/sshfiles/authorized_keys /home/$ME/.ssh/authorized_keys


