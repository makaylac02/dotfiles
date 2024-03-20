#!bin/bash
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
			ninvaders \
			nsnake
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
	
	if [[ -e $(ls awsdl/awscliv2.zip 2> /dev/null | head -1) ]]; then
		echo "AWS CLI V2 installer found, running it"
		unzip awsdl/awscliv2.zip -d awsdl/
		./awsdl/aws/install 
	else
		mkdir awsdl
		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awsdl/awscliv2.zip"
		unzip awsdl/awscliv2.zip -d awsdl/
		./awsdl/aws/install
	fi 

	# moving git files
	git() {
	chmod -R +x git.sh
	bash git.sh
	}
	git

	
	# moving bashrc
	bash() {
	chmod -R +x bashconfig.sh
	bash bashconfig.sh
	}
	bash	
	
	
	# moving ssh files
	sshconfig() {
	chmod -R +x sshconfig.sh
	bash sshconfig.sh
	}
	sshconfig
	
	

	# installing Vundle
	vundleconfig() {
	chmod -R +x vundleconfig.sh
	bash vundleconfig.sh
	}
	vundleconfig

	
	# calling methods
	
	# decided to make vim / Vundle it's own thing
	#bash vundle-install.sh
	#ln -s /home/$ME/dotfiles/vimrc /home/$ME/.vimrc
	#vim +PluginInstall +qall	
else
	echo "Script is not running as root, exiting..." 1>&2
	exit 1

fi

