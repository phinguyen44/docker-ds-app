# which to run without dependencies
.PHONY: docker-build docker-run docker-run-mount jupyter docker-clean docker-rm-container docker-rm-image docker-upload docker-login docker-push docker-start-container docker-start docker-attach-container

# variables (make)
CONTAINER_NAME := phiproject
IMAGE_NAME := phinguyen44/ds-project
HOST_PORT := 9999
CONTAINER_PORT := 8888

# targets
docker-build:
	docker build -t $(IMAGE_NAME) .

docker-run:
	docker run -td -p $(HOST_PORT):$(CONTAINER_PORT) --name $(CONTAINER_NAME) $(IMAGE_NAME) /bin/bash

docker-run-mount:
	docker run -td -p $(HOST_PORT):$(CONTAINER_PORT) -v $(shell pwd):/app --name $(CONTAINER_NAME) $(IMAGE_NAME) /bin/bash

docker-start: 
	@echo "Launched $(CONTAINER_NAME)..."
	docker start $(CONTAINER_NAME)
	docker exec -it $(CONTAINER_NAME) /bin/bash

jupyter:
	jupyter notebook --ip='*' --port=$(CONTAINER_PORT) --no-browser --allow-root

docker-clean: docker-rm-image docker-rm-container

docker-rm-container:
	docker rm $(CONTAINER_NAME)

docker-rm-image:
	docker image rm $(IMAGE_NAME)

docker-upload: docker-login docker-push

docker-login:
	docker login

docker-push:
	docker push $(IMAGE_NAME)