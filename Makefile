nexus_docker_dev_repository ?= docker-dev.ceterainternal.com
nexus_docker_repository ?= docker.ceterainternal.com
docker_image_name ?= devopsexamples-settings-backend
docker_build_image_name ?= base-node
docker_build_image_tag ?= latest
build_num ?= local
major_minor ?= 1.0
goss_dist ?= https://github.com/aelsabbahy/goss/releases/download/v0.1.6/goss-linux-amd64

default: development

build_local:
	docker build -t $(nexus_docker_dev_repository)/$(docker_image_name):local .

build_development:
	docker build -t $(nexus_docker_dev_repository)/$(docker_image_name):latest-dev .

build_stable:
	docker build -t $(nexus_docker_dev_repository)/$(docker_image_name):latest-stable .

test_local:
	echo "unit test stub"

test_development:
	echo "unit test stub"

test_stable:
	echo "unit test stub"

test_app:
	echo "app test stub"

tag_development:
	docker tag $(nexus_docker_dev_repository)/$(docker_image_name):latest-dev $(nexus_docker_dev_repository)/$(docker_image_name):$(major_minor).dev.$(build_num)

tag_stable:
	docker tag $(nexus_docker_dev_repository)/$(docker_image_name):latest-stable $(nexus_docker_dev_repository)/$(docker_image_name):$(major_minor).stable.$(build_num)

push_all:
	docker push $(nexus_docker_dev_repository)/$(docker_image_name)

build_pullrequest: build_development test_development

local: build_local
development: build_development tag_development push_all
pull_request: build_pullrequest 
stable: build_stable tag_stable push_all
