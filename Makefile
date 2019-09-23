all: build

DOCKER_NAME=testapi

build: run-golangci-lint
	@echo "running go build ... "
	@env GOOS=darwin go build 

run-golangci-lint:	
	@echo "running golangci-lint ... "
	@golangci-lint run ./...

run-test:
	@echo "running go test ... "
	@go test -v 

build-docker-img:
	@echo "running build docker image ... "
	@env GOOS=linux go build
	@docker build -t $(DOCKER_NAME) . 

clean:
	@rm -rf testapi