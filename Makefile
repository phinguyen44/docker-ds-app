# which to run without dependencies
.PHONY: docker-build docker-run docker-run-mount jupyter docker-clean docker-container-rm docker-rm docker-upload docker-login docker-push

# variables (make)
CONTAINER_NAME := phiproject
IMAGE_NAME := phinguyen44/ds-project
HOST_PORT := 9999
CONTAINER_PORT := 8888

# targets
docker-build:
	docker build -t $(IMAGE_NAME) .

docker-run:
	docker run -p $(HOST_PORT):$(CONTAINER_PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME)

docker-run-mount:
	docker run -p $(HOST_PORT):$(CONTAINER_PORT) -v $(shell pwd):/app --name $(CONTAINER_NAME) $(IMAGE_NAME) 

jupyter:
	jupyter notebook --ip='*' --port=$(CONTAINER_PORT) --no-browser --allow-root

docker-clean: docker-container-rm docker-image-rm

docker-container-rm:
	docker rm $(CONTAINER_NAME)

docker-image-rm:
	docker image rm $(IMAGE_NAME)

docker-upload: docker-login docker-push

docker-login:
	docker login

docker-push:
	docker push $(IMAGE_NAME)