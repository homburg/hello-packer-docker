.PHONY: all validate

FILE = $(shell find . -type f -name "*.yml")
PACKER_YAML = ./packer-yaml.py

all: files/hello
	$(PACKER_YAML) $(FILE) | packer build -

validate: files/hello
	$(PACKER_YAML) $(FILE) | packer validate -

%: %.go
	go build -o $@ $<
