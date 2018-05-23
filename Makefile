all: image

REV     :=":$(shell git rev-parse --short HEAD)"
REGISTRY:=registry.ng.bluemix.net/nibalizer

image: .image

.image: Dockerfile
	docker build -t showoff .
	touch .image

push: image
	docker tag showoff $(REGISTRY)/showoff
	docker push $(REGISTRY)/showoff

run: image
	cd app ; docker run -ti --rm -p 9090:9090 \
		-w /app -v $(CURDIR):/app showoff serve
