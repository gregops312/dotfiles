#!/bin/bash

#	Vars
vim='which vim'

if [ "$vim" != 'vim not found' ]; then
	cp vim/.vimrc ~/
else
	clear
	echo 'vim not found'
fi
