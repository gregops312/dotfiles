FROM ubuntu:25.10

RUN apt-get update -y && \
    apt-get install -y \
      autojump \
      bats \
      curl \
      direnv \
      git \
      make \
      software-properties-common \
      sudo \
      tmux \
      vim \
      zsh && \
    useradd --create-home --user-group --shell /bin/zsh test && \
    echo 'test ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/test && \
    chmod 0440 /etc/sudoers.d/test

COPY --chown=test:test . /home/test/dotfiles

USER test
WORKDIR /home/test/dotfiles

CMD ["bash", "install"]
