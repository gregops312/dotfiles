#!/usr/bin/env python3.6
# import argparse
import logging
import platform
import subprocess


logging.basicConfig(
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%m/%d/%Y %I:%M:%S %p'
)
logger = logging.getLogger(__name__)
logger.setLevel('INFO')

def bash():
    logger.info("Setting up Bash")
    subprocess.run(["./bash/set-bash.sh"], shell=True)

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
    subprocess.run(["./tmux/set-tmux.sh"], shell=True)

def vim():
    logger.info("Setting up Vim")
    subprocess.run(["./vim/set-vim.sh"], shell=True)

def zsh():
    logger.info("Setting up Zsh")
    subprocess.run(["./zsh/set-zsh.sh"], shell=True)

def main():
    check_os()

if __name__ == "__main__":
    main()
