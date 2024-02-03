SHELL=/bin/bash

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain

REDIS_VERSION ?= 7.2

TAG ?= latest
PLATFORM ?= linux/amd64

DOCKER_IMAGE_NAME:=nuldark/redis
DOCKER_IMAGE:=$(DOCKER_IMAGE_NAME):$(TAG)

build:
	docker buildx build \
	   --load \
       --platform $(PLATFORM) \
       --tag $(DOCKER_IMAGE) \
       --file $(REDIS_VERSION)/Dockerfile $(REDIS_VERSION)/

push:
	docker buildx build \
	   --push \
       --platform $(PLATFORM) \
       --tag $(DOCKER_IMAGE) \
       --file $(REDIS_VERSION)/Dockerfile $(REDIS_VERSION)/

release: build push