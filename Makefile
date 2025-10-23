.PHONY: test
test:
	docker build -t test:latest .

.PHONY: run
run: test
	docker run -it --rm --name test test:latest
