.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: build
build:
	bundle exec rubocop \
		bin lib spec/integration spec/deck_spec.rb spec/card_spec.rb spec/runner_spec.rb Gemfile
	bundle exec rspec

.PHONY: run
run:
	bin/run.rb

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make build${NC}         run the build"
	@echo "${YELLOW}make run${NC}           run the script"
	@echo
