FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install -y autojump curl direnv git sudo tmux vim zsh && \
    useradd --create-home --user-group test
COPY . home/test/code/dotfiles

RUN chown -R test:test /home/test

# USER test

WORKDIR /home/test/code/dotfiles
