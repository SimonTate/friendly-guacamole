CP ?= cp
PANDOC ?= pandoc

.PHONY: clean

source  := pages
output  := .build
header  := $(source)/header.html
footer  := $(source)/footer.html
sources := $(shell find $(source) -name "*.md")
sources += $(shell find $(source) -name "*.png")

objects := $(subst md,html,$(sources))
objects := $(subst $(source),$(output),$(objects))

all: $(objects)

$(output)/%.html: $(source)/%.md $(header) $(footer)
	mkdir -p $(@D)
	$(PANDOC) $(^) -o $(@) -H $(header) -H $(footer)

$(output)/%.png: $(source)/%.png
	mkdir -p $(@D)
	$(CP) $(^) $(@)

clean:
	rm -rf $(output)
