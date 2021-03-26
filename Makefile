NAME     = codex
VERSION ?= dev

docker-image:
	docker image build --tag $(NAME):$(VERSION) .

start: docker-image
	docker container run \
		--rm \
		--interactive --tty \
		--publish 127.0.0.1:4567:4567 \
		$(NAME):$(VERSION) \
		--no-edit \
		--mathjax \
		--emoji \
		--ref main
