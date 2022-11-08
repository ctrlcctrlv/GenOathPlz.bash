SHELL := /bin/bash
DIR := $(strip $(shell dirname -- $(realpath $(lastword $(MAKEFILE_LIST)))))
SCRIPT := GenOathPlz
PREFIX = $(HOME)/.local/bin
HASH := $(shell echo \#)

.PHONY:
install:
	for f in `find $(DIR) -name $(SCRIPT)'*' -type f`; do \
		(ln -s "$$f" "$(PREFIX)/$$(basename -- "$$f")" 2> /dev/null) || \
		(>&2 echo Already installed: "$$f" && exit 0) \
	done

.PHONY:
uninstall:
	INSTALLED=($(shell find $(PREFIX) -name $(SCRIPT)'*')); \
	[ $${$(HASH)INSTALLED} -ne 0 ] && \
		for f in "$${INSTALLED[@]}"; do \
			>&2 echo Removing "$$f" && rm -f "$$f"; \
		done \
	|| true
