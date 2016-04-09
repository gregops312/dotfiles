#!/bin/bash

#	Vars
tmux='which tmux'

if [ "$tmux" != 'tmux not found' ]; then
	cp tmux/.tmux.conf ~/
else
	clear
	echo 'tmux not found'
fi
