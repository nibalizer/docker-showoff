all: image

REV     :=":$(shell git rev-parse --short HEAD)"
REGISTRY:=registry.ng.bluemix.net/nibalizer

image: .image

.image: Dockerfile
	docker build -t docker-showoff .
	touch .image

push: image
	docker tag docker-showoff $(REGISTRY)/docker-showoff
	docker push $(REGISTRY)/docker-showoff

run: image
	docker run -ti --rm -p 9090:9090 \
		-v $(CURDIR):/srv/showoff docker-showoff serve
