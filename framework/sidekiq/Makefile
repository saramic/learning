.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: rubocop
rubocop:
	bundle exec rubocop

.PHONY: rubocop-fix
rubocop-fix:
	bundle exec rubocop -A

.PHONY: test
test:
	bundle exec rspec

.PHONY: build
build: rubocop

.PHONY: demo
demo:
	bundle exec sidekiq --require ./sidekiq_001.2/worker.rb

.session.key:
	bundle exec ruby -e 'require "securerandom"; File.open(".session.key", "w"){|f|\
		f.write(SecureRandom.hex(32))}'

.PHONY: sidekiq-web
sidekiq-web: .session.key
	bundle exec rackup

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Development"
	@echo
	@echo "${YELLOW}make rubocop${NC}       run rubocop"
	@echo "${YELLOW}make rubocop-fix${NC}   apply rubocop -A fixes"
	@echo
	@echo "Demo"
	@echo
	@echo "${YELLOW}make demo${NC}          run some demos"
	@echo "${YELLOW}make sidekiq-web${NC}   run sidekiq/web via sinatra http://127.0.0.1:9292/"
	@echo
