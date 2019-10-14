DOCKER_COMMAND := docker
DOCKER_USERNAME := wrboyce
DOCKER_REPONAME := utils
DOCKER_PLATFORMS := linux/amd64,linux/arm64,linux/arm/v7

all:
	@$(foreach DIR, $(wildcard *), test -f $(DIR)/Dockerfile && $(DOCKER_COMMAND) build -t $(DOCKER_USERNAME)/$(DOCKER_REPONAME):$(DIR) $(DIR) ;)

gen:
	@$(foreach DIR, $(wildcard *), test -f $(DIR)/Dockerfile && echo ==== $(DIR) ==== && echo $(DOCKER_COMMAND) build -t $(DOCKER_USERNAME)/$(DOCKER_REPONAME):$(DIR) - \<\<\<\$$\(base64 -d \<\<\<$$(base64 $(DIR)/Dockerfile)\) && echo ;)

clean:
	@$(foreach DIR, $(wildcard *), test -f $(DIR)/Dockerfile && $(DOCKER_COMMAND) rmi $(DOCKER_USERNAME)/$(DOCKER_REPONAME):$(DIR) ;)

build:
	@$(foreach DIR, $(wildcard *), test -f $(DIR)/Dockerfile && $(DOCKER_COMMAND) buildx build --platform $(DOCKER_PLATFORMS) --load -t $(DOCKER_USERNAME)/$(DOCKER_REPONAME):$(DIR) $(DIR) ;)

test:
	@$(foreach DIR, $(wildcard *), test -f $(DIR)/Dockerfile && $(DOCKER_COMMAND) run --rm $(DOCKER_USERNAME)/$(DOCKER_REPONAME):$(DIR) -h ;)

publish:
	@$(foreach DIR, $(wildcard *), test -f $(DIR)/Dockerfile && $(DOCKER_COMMAND) buildx build --platform $(DOCKER_PLATFORMS) --push -t $(DOCKER_USERNAME)/$(DOCKER_REPONAME):$(DIR) $(DIR) ;)

.PHONY: all gen clean build test publish
