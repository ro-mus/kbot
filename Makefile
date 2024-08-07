APP=$(shell basename $(shell git remote get-url origin) | sed 's/\.git$$//')
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

build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${shell dpkg --print-architecture} go build -v -o kbot -ldflags "-X="github.com/ro-mus/kbot/cmd.appVersion=${VERSION}

linux: format get
	CGO_ENABLED=0 GOOS=linux GOARCH=${shell dpkg --print-architecture} go build -v -o kbot -ldflags "-X="github.com/ro-mus/kbot/cmd.appVersion=${VERSION}
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGET_ARC}

image: 
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGET_ARC}

push: image
	docker tag ${REGISTRY}/${APP}:${VERSION}-${TARGET_ARC} ${REGISTRY}/${APP}:${VERSION}-${TARGET_ARC}
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGET_ARC}
	
clean:
	rm -rf kbot
	@IMAGE_TAG=${REGISTRY}/${APP}:${VERSION}-${TARGETOS}-${TARGET_ARC}; \
	if [ -n "$$(docker images -q $${IMAGE_TAG})" ]; then docker rmi -f $${IMAGE_TAG}; else echo "Image not found"; fi