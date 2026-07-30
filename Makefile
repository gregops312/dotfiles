IMAGE := dotfiles:latest
UID   := $(shell id -u)
GID   := $(shell id -g)
.DEFAULT_GOAL := build

.PHONY: build clean install run test-local test-docker

# Build the Docker image
build:
	docker build \
	--build-arg UID=$(UID) \
	--build-arg GID=$(GID) \
	-t $(IMAGE) .

# Remove the Docker image and any test-run home directory
clean:
	docker rmi $(IMAGE) 2>/dev/null || true
	rm -rf .test-home

install:
	./install

# Open an interactive shell inside the container for debugging
run: build
	docker run -it --rm --name dotfiles-debug $(IMAGE) bash

# Run the full bats suite (unit + file assertions) against the current $HOME.
# NOTE: file assertions require ./install to have already run into $HOME.
test-local:
	tests/libs/bats/bin/bats --recursive tests/unit/
	tests/libs/bats/bin/bats --recursive tests/files/

# Run Docker container, install script, & test-local.
# Use .test-home as the home directory for the test run.
test-docker: build
	docker run --rm \
	    -v "$(PWD)":/home/test/dotfiles \
	    $(IMAGE) \
	    bash -lc 'export HOME=/home/test/dotfiles/.test-home; rm -rf "$$HOME"; mkdir -p "$$HOME"; bash install && make test-local'
