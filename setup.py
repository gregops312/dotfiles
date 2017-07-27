#!/usr/bin/env python3.6
# import argparse
import logging
import platform
import shutil
import subprocess

from os.path import expanduser

logging.basicConfig(
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%m/%d/%Y %I:%M:%S %p'
)
logger = logging.getLogger(__name__)
logger.setLevel('INFO')
user_home = expanduser("~")

def bash():
    logger.info("Setting up Bash")
    shutil.copyfile("bash/.bash_profile", f'{user_home}/.bash_profile')
    shutil.copyfile("bash/.bashrc", f'{user_home}/.bashrc')

def check_os():
    if platform.system() == "Darwin":
        logger.info("Mac OSx found")
        bash()
        tmux()
        vim()
        zsh()
    elif platform.system() == "Linux":
        logger.info("Linux found")
        bash()
        tmux()
        vim()
        zsh()
    elif platform.system() == "MINGW64":
        logger.info("Windows Bash found")
        vim()
    elif platform.system() == "CYGWIN_NT":
        logger.info("Windows Cygwin found")
        bash()
        vim()
        zsh()
    else:
        logger.info("OS is not supported")

def tmux():
    logger.info("Setting up Tmux")
    shutil.copyfile("tmux/.tmux.conf", f'{user_home}/.tmux.conf')

def vim():
    logger.info("Setting up Vim")
    shutil.copyfile("vim/.vimrc", f'{user_home}/.vimrc')

def zsh():
    logger.info("Setting up Zsh")
    shutil.copyfile("zsh/.zshrc", f'{user_home}/.zshrc')
    shutil.copyfile("zsh/greg-kman.zsh-theme", f'{user_home}/.oh-my-zsh/themes/greg-kman.zsh-theme')

def main():
    check_os()

if __name__ == "__main__":
    main()



    # vim='which vim'
    #
    # if [ "$vim" != 'vim not found' ]; then
    # 	cp vim/.vimrc ~/
    # else
    # 	clear
    # 	echo 'vim not found'
    # fi
