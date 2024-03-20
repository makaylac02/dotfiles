#!/bin/bash
#Username that called script
echo $SUDO_USER
ME=$SUDO_USER

# check if effective user id is 0 (root)

if [[ "$(id -u)" -eq 0 ]]; then
	echo "Script is running as root"
	# check if apt is package manager
	# if apt is package manager and you run which apt it will specify a path to where its stored
	echo $(which apt)
	if [[ -n "$(which apt)" ]]; then
		echo "apt is installed exactly as specified."
		apt install -y \
			nmap \
			dnsutils \
			libgl1-mesa-glx \
			libegl1-mesa \
			libxrandr2 \
			libxss1 \
			libxcursor1 \
			libxcomposite1 \
			libasound2 \
			libxi6 \
			libxtst6 \ 
			unzip

		if [[ -e $(ls Anaconda3*.sh 2> /dev/null | head -1) ]]; then
			echo "Installer found, running it"
		        bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/kduncan/anaconda3/bin" >> /home/$ME/.profile
	        else
	 		echo "Downloading anaconda installer"		
			curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
			bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p /home/$ME/anaconda3
			echo "PATH=$PATH:/home/kduncan/anaconda3/bin" >> /home/$ME/.profile
		fi
	else
		echo "apt is not installed at the specified location."
	fi
	

	# moving git files
	git() {
	chmod -R +rx /home/$ME/dotfiles/configfiles/git.sh
	bash /home/$ME/dotfiles/configfiles/git.sh
	}
	git

	
	# moving bashrc
	bashconfig() {
	chmod -R +rx /home/$ME/dotfiles/configfiles/bashconfig.sh
	bash /home/$ME/dotfiles/configfiles/bashconfig.sh
	}
	bashconfig	
	
	
	# moving ssh files
	sshconfig() {
	chmod -R +rx /home/$ME/dotfiles/configfiles/sshconfig.sh
	bash /home/$ME/dotfiles/configfiles/sshconfig.sh
	}
	sshconfig
	
	

	# installing Vundle
	vundleconfig() {
	chmod -R +rx /home/$ME/dotfiles/configfiles/vundleconfig.sh
	bash /home/$ME/dotfiles/configfiles/vundleconfig.sh
	}
	vundleconfig
	
	# installing aws cli
	awsconfig() {
	chmod -R +rx /home/$ME/dotfiles/configfiles/awsconfig.sh
	bash /home/$ME/dotfiles/configfiles/awsconfig.sh
	}
	awsconfig
	
else
	echo "Script is not running as root, exiting..." 1>&2
	exit 1

fi

