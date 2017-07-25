#!/bin/bash

#	Vars
bash='which bash'

if [ "$bash" != 'bash not found' ]; then
	cp bash/.bash_profile ~/
	cp bash/.bashrc ~/
else
	clear
	echo 'bash not found'
fi
