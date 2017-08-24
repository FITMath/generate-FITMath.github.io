HUGOFILE := config.toml
HUGOBASIC = hugo
HUGOGEN := $(HUGOBASIC)

all: generate

generate: $(HUGOFILE)
	$(HUGOGEN)

serve: $(HUGOFILE)
	$(HUGOGEN) -w --verbose server