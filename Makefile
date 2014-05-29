FILE = $(shell find . -type f -name "*.yml")
all: files/hello
	packer-yaml $(FILE) | packer build -

validate: files/hello
	packer-yaml $(FILE) | packer validate -

%: %.go
	go build -o $@ $<
