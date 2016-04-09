#!/bin/bash

# Run the scripts for each
bash ./testing/kman.sh

#	Bash
bash ./bash/set-bash.sh

#   Tmux
bash ./tmux/set-tmux.sh

#   Vim
bash ./vim/set-vim.sh

#   Zsh
bash ./zsh/set-zsh.sh

# Set 
source ~/.zshrc
clear