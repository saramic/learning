.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: install
install:
	bundle

.PHONY: rubocop-fix
rubocop-fix:
	bundle exec rubocop -A

.PHONY: rubocop
rubocop:
	bundle exec rubocop

.PHONY: test
test:
	bundle exec rspec

.PHONY: build
build: rubocop test

.PHONY: demo
demo:
	bundle exec ruby bin/run.rb

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make install${NC}      install"
	@echo "${YELLOW}make build${NC}        build the project"
	@echo
	@echo "${YELLOW}make demo${NC}         demo the project"
	@echo
	@echo "Development"
	@echo
	@echo "${YELLOW}make test${NC}         run tests (rspec)"
	@echo "${YELLOW}make rubocop${NC}      rubocop"
	@echo "${YELLOW}make rubocop-fix${NC}  rubocop fix"
	@echo
