
.PHONY: all build


all: build

build:
	ansible-builder build --tag quay.io/bthomass/events-demo-ci-cd:latest --container-runtime docker

docker-build:
	docker build -f context/Dockerfile -t quay.io/bthomass/events-demo-ci-cd:latest context

run:
	docker run -it --env-file env -p 5001:5001 quay.io/bthomass/events-demo-ci-cd ansible-events rules.yml -i inventory.yml  --env-vars webhook,connection_str,queue_name,token,management_url -S sources --debug

shell:
	docker run -it  quay.io/bthomass/events-demo-ci-cd /bin/bash

push:
	docker push quay.io/bthomass/events-demo-ci-cd:latest