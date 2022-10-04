build ?= pdfs

PROJECTS := degenerate journal kodaira-embedding nakano-positive sgct

all: $(patsubst %, $(build)/%.pdf, $(PROJECTS))

$(build):
	mkdir -p $(build)

.PHONY: clean
clean:
	rm -rf $(build)

define pdf
$$(build)/$(1).pdf: $$(build) $$(SHELL find -type f -name "main.*" $(1))
	nix build .#$(1)
	cp result/$(1).pdf $$<
endef

# Results in, for example:
#
#$(build)/sgct.pdf: $(build) $(SHELL find -type f -name "main.*" sgct)
#	nix build .#sgct
#	cp result/sgct.pdf $<

$(foreach project,$(PROJECTS),$(eval $(call pdf,$(project))))
