#!/bin/bash

# Mac
if [[ $(uname) == *"Darwin"* ]]; then
    bash ./bash/set-bash.sh
    bash ./tmux/set-tmux.sh
    bash ./vim/set-vim.sh
    bash ./zsh/set-zsh

# Windows Bash
elif [[ $(uname) == *"MINGW64"* ]]; then
    bash ./bash/set-bash.sh

# Windows Cygwin
elif [[ $(uname) == *"CYGWIN_NT"* ]]; then

# Linux
elif [[ $(uname) == *"Linux"* ]]; then
    bash ./bash/set-bash.sh
    bash ./tmux/set-tmux.sh
    bash ./vim/set-vim.sh
    bash ./zsh/set-zsh
fi

# Run the scripts for each
# bash ./testing/kman.sh
