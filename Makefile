.PHONY: \
	__build_lint_image \
	connect \
	lint \
	lint-fix \
	start \
	stop \

__build_lint_image:
	@docker build -q -f .docker/ci.Dockerfile -t ci .

connect:
	@docker-compose -f .docker/docker-compose.yml exec web bash

lint: __build_lint_image
	@docker run --rm -v $(shell pwd):/code ci isort -c .
	@docker run --rm -v $(shell pwd):/code ci black --check .
	@docker run --rm -v $(shell pwd):/code ci flake8

lint-fix: __build_lint_image
	@docker run --rm -v $(shell pwd):/code ci isort .
	@docker run --rm -v $(shell pwd):/code ci black .

start:
	@USER="$$(id -u):$$(id -g)" docker-compose -f .docker/docker-compose.yml up --build -d --remove-orphans

stop:
	@docker-compose -f .docker/docker-compose.yml stop
