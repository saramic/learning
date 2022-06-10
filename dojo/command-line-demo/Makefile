.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: sidekiq
sidekiq:
	bundle exec sidekiq --require ./lib/workers/word_count_worker.rb

.PHONY: demo
demo:
	bin/runner.rb bin/runner.rb
	bundle exec ruby -Ilib \
		-e "require 'workers/word_count_worker'; \
			pp WordCountWorker.perform_async(ARGV.first)" \
		bin/runner.rb

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
	@echo "Demo"
	@echo
	@echo "${YELLOW}make demo${NC}          run some demos"
	@echo "${YELLOW}make sidekiq${NC}       run sidekiq"
	@echo "${YELLOW}make sidekiq-web${NC}   run sidekiq/web via sinatra http://127.0.0.1:9292/"
	@echo
