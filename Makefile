SHELL := /bin/bash
REV_FILE=.make-rev-check

# Sets the revision and stores it in .make-rev-check.
set-rev:
	git rev-parse --short HEAD > $(REV_FILE)

images: set-rev
	./deploy/images/make-image.sh deploy/images/app.Dockerfile "docker-showoff:$$(cat $(REV_FILE))"

tag-image: set-rev
	docker tag "docker-showoff:$$(cat $(REV_FILE))" "registry.ng.bluemix.net/nibalizer/docker-showoff:$$(cat $(REV_FILE))"

# Uploads image to IBM Cointainer Repository. Runs set-rev to ensure that the rev_file exists.
upload-image: set-rev
	docker push "registry.ng.bluemix.net/nibalizer/docker-showoff:$$(cat $(REV_FILE))"

# Runs all image related tasks.
all-images: set-rev images tag-images upload-images

run: docker run -it --rm  -p 9090:9090 --mount type=bind,source="$(pwd)",target=/srv/showoff "nibalizer/docker-showoff:$$(cat $(REV_FILE))" serve
