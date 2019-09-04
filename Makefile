DOCKER_USERNAME := wrboyce
DOCKER_REPONAME := utils
DOCKER_PLATFORMS := linux/amd64,linux/arm64,linux/arm/v7

all:
	@$(foreach DIR, $(wildcard *), test -f $(DIR)/Dockerfile && docker build -t $(DOCKER_USERNAME)/$(DOCKER_REPONAME):$(DIR) $(DIR) ;)

clean:
	@$(foreach DIR, $(wildcard *), test -f $(DIR)/Dockerfile && docker rmi $(DOCKER_USERNAME)/$(DOCKER_REPONAME):$(DIR) ;)

publish:
	@$(foreach DIR, $(wildcard *), test -f $(DIR)/Dockerfile && docker buildx build --platform $(DOCKER_PLATFORMS) --push -t $(DOCKER_USERNAME)/$(DOCKER_REPONAME):$(DIR) $(DIR) ;)

.PHONY: all clean publish
