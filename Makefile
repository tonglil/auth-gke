.PHONY: build push docker

default: build

build:
	bin/build

build-all:
	bin/build
	BASE=alpine bin/build
	BASE=slim bin/build

push:
	bin/push

docker: build push

pull:
	docker pull tonglil/auth-gcloud:latest
	docker pull tonglil/auth-gcloud:slim
	docker pull tonglil/auth-gcloud:alpine

version:
	docker run -it --rm --entrypoint=bash tonglil/auth-gcloud:alpine gcloud version
