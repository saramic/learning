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
	MAKELEVEL=0 asdf install

.PHONY: setup
setup: install
	createdb rails-meet-rom_dev || echo "rails-meet-rom_dev db probably already exist"

.PHONY: demo
demo:
	bundle exec rails r ''

.PHONY: build
build:
	bundle exec rspec

.PHONY: clean
clean:
	dropdb rails-meet-rom_dev

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make setup${NC}                     install and setup"
	@echo "${YELLOW}make build${NC}                     run tests"
	@echo "${YELLOW}make demo${NC}                      run a demo"
	@echo
	@echo "${YELLOW}make clean${NC}                     clean up"
	@echo