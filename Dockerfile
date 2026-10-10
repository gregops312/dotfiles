FROM ubuntu:25.10

RUN apt-get update -qq -y && \
    apt-get install --no-install-recommends -qq -y \
      bats \
      curl \
      make \
      software-properties-common \
      sudo && \
    useradd --create-home --user-group --shell /bin/zsh test && \
    echo 'test ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/test && \
    chmod 0440 /etc/sudoers.d/test

COPY --chown=test:test . /home/test/dotfiles

USER test
WORKDIR /home/test/dotfiles

CMD ["bash", "install"]
