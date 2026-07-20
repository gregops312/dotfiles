IMAGE := dotfiles:latest
.DEFAULT_GOAL := build

.PHONY: build test-docker run clean

# Build the Docker image
build:
	docker build -t $(IMAGE) .

# Build then run full install + file assertions inside a clean container
test-docker: build
	docker run --rm $(IMAGE)

# Open an interactive shell inside the container for debugging
run: build
	docker run -it --rm --name dotfiles-debug $(IMAGE) bash

clean:
	docker rmi $(IMAGE) 2>/dev/null || true
