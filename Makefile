HUGOFILE := gen/config.toml
HUGOBASIC = hugo -s "gen"
HUGOGEN := $(HUGOBASIC) -d "`pwd`"

all: generate

$(HUGOFILE):
	hugo new site gen
	git submodule add git@github.com:FITMath/FITMathMinimal.git gen/themes/FITMathMinimal

generate: $(HUGOFILE)
	$(HUGOGEN)

serve: $(HUGOFILE)
	$(HUGOGEN) -w --verbose server

clean:
	$(RM) -r categories content css js tags themes

FILE ?= tmp.html
FILEFLAGS ?=
new: $(HUGOFILE)
	$(HUGOBASIC) new "$(FILE)" $(FILEFLAGS)

saveChanges:
	git commit -a -m 'Update to generated files after commit `git rev-parse HEAD`'

pushChanges: saveChanges
	git push
