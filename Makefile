REPO = ghcr.io/nulldark/redis
REDIS_VERSION?=7.2.4
TARGET_PLATFORM?=linux/amd64

ifeq ($(TAG),)
	TAG ?= $(REDIS_VERSION)
endif

build:
	docker build --tag $(REPO):$(TAG) .

buildx-build-amd64:
	docker buildx build --load \
		--platform linux/amd64 \
		--tag $(REPO):$(REDIS_VERSION) .

buildx-build:
	docker buildx build --platform $(TARGET_PLATFORM) \
		--tag $(REPO):$(REDIS_VERSION) .

buildx-push:
	docker buildx build --platform=$(TARGET_PLATFORM) --push \
		--tag $(REPO):$(TAG) .