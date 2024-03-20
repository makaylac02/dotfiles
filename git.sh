#!/bin/bash


# setting global user name and email
git config --global user.name MakaylaCarr
git config --global user.email carr.137@wright.edu


# editor set to vim
git config --global core.editor "vim"

# excluding git ignore
git config --global core.excludesfile ~/.gitignore_global

# setting autocorrect
git config --global help.autocorrect 80

# Symbolic linking and moving
ln -s /home/$ME/dotfiles/gitfiles/.gitconfig /home/$ME/.gitconfig
ln -s /home/$ME/dotfiles/gitfiles/.gitmessage.txt /home/$ME/.gitmessage.txt

echo "test"

