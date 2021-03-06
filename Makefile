BUNDLE = bundle
RAKE   = $(BUNDLE) exec rake

PACKAGE := conreality
VERSION := $(shell cat VERSION)

SOURCES := $(wildcard lib/*.rb lib/*/*.rb lib/*/*/*.rb)
OUTPUTS :=

pkg/$(PACKAGE)-$(VERSION).gem: $(SOURCES)
	$(RAKE) build

all: build

build: Rakefile pkg/$(PACKAGE)-$(VERSION).gem

check: Rakefile $(SOURCES)
	$(RAKE) spec

dist: pkg/$(PACKAGE)-$(VERSION).gem

install: Rakefile pkg/$(PACKAGE)-$(VERSION).gem
	$(RAKE) install

clean:
	@rm -f *~ *.gem pkg/*

distclean: clean

mostlyclean: clean

.PHONY: build check install clean distclean mostlyclean
