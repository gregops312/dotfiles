FROM ubuntu:25.10

RUN apt-get update -y && \
    apt-get install -y \
      autojump \
      bats \
      curl \
      direnv \
      git \
      jq \
      make \
      software-properties-common \
      sudo \
      tmux \
      vim \
      wget \
      zsh && \
    useradd --create-home --user-group --shell /bin/zsh test && \
    echo 'test ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/test && \
    chmod 0440 /etc/sudoers.d/test

RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq && \
    chmod +x /usr/local/bin/yq

COPY --chown=test:test . /home/test/dotfiles

USER test
WORKDIR /home/test/dotfiles

CMD ["bash", "install"]
