#!/bin/bash

#	Vars
zsh='which zsh'

if [ "$zsh" != 'zsh not found' ]; then
	cp zsh/.zshrc ~/
	cp zsh/greg-gkman.zsh-theme ~/.oh-my-zsh/themes/
else
	clear
	echo 'zsh not found'
fi
