HUGOFILE := config.toml
HUGOBASIC = binaries/hugo
HUGOGEN := $(HUGOBASIC)
UNAME=$(shell uname -s)

ifeq ($(UNAME),Linux)
$(HUGOFILE): binaries/hugo_extended_0.52_Linux-64bit.tar.gz
	cd $(dir $<) && tar xvzf $(notdir $<)
endif
ifeq ($(UNAME),Darwin)
$(HUGOFILE): binaries/hugo_extended_0.52_macOS-64bit.tar.gz
	cd $(dir $<) && tar xvzf $(notdir $<)
endif
all: generate

generate: $(HUGOFILE)
	$(HUGOGEN) --verbose

serve: $(HUGOFILE)
	$(HUGOGEN) -w --verbose server
