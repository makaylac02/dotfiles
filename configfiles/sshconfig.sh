#!/bin/bash
echo $SUDO_USER
ME=$SUDO_USER

ssh_config() {
	if [ -d ~/.ssh ]; then
		echo 'SSH folder exists'
	else 
		echo 'Creating SSH folder'
		mkdir ~/.ssh
	fi

	echo 'File linking: '
	ln -s /home/$ME/dotfiles/sshfiles/config /home/$ME/.ssh/config
	ln -s /home/$ME/dotfiles/sshfiles/authorized_keys /home/$ME/.ssh/authorized_keys

}

ssh_config
