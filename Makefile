CP ?= cp

.PHONY: all
all: .build

.build:
	mkdir .build
	$(CP) index.html .build

