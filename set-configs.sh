#!/bin/bash

echo "Determining OS . . ."

# Mac
if [[ $(uname) == *"Darwin"* ]]; then
    echo "Mac OSx found."
    bash ./bash/set-bash.sh
    bash ./tmux/set-tmux.sh
    bash ./vim/set-vim.sh
    bash ./zsh/set-zsh.sh

# Windows Bash
elif [[ $(uname) == *"MINGW64"* ]]; then
    echo "Windows Bash found."
    bash ./bash/set-bash.sh
    bash ./vim/set-vim.sh

# Windows Cygwin
elif [[ $(uname) == *"CYGWIN_NT"* ]]; then
    echo "Windows Cygwin found."
    bash ./bash/set-bash.sh
    bash ./vim/set-vim.sh
    bash ./zsh/set-zsh.sh

# Linux
elif [[ $(uname) == *"Linux"* ]]; then
    echo "Linux found."
    bash ./bash/set-bash.sh
    bash ./tmux/set-tmux.sh
    bash ./vim/set-vim.sh
    bash ./zsh/set-zsh.sh
fi

# Run the scripts for each
# bash ./testing/kman.sh
