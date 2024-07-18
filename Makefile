APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=ghcr.io/ro-mus
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS=linux
TARGET_ARC=amd64

format:
	gofmt -s -w ./

get:
	go get

lint:
	golint

test:
	go test -v

linux: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o kbot -ldflags "-X="github.com/ro-mus/kbot/cmd.appVersion=${VERSION}

image: linux
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-$(TARGET_ARC)

push: image
	docker tag ${REGISTRY}/${APP}:${VERSION}-${TARGET_ARC} ${REGISTRY}/${APP}:${VERSION}-${TARGET_ARC}
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGET_ARC}
	
clean:
	rm -rf kbot
	IMAGE_TAG=$$(docker images -q | head -n 1); \
	if [ -n "$${IMAGE_TAG}" ]; then  docker rmi -f $${IMAGE_TAG}; else printf "$RImage not found$D\n"; fi