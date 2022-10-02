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
	createdb rom_and_dry_dev || echo "rom_and_dry_dev db probably already exist"
	rake db:migrate

.PHONY: demo
demo:
	bundle exec ruby -e '\
		require_relative "system/application/container";\
		Projects::Application.finalize!;\
		require_relative "lib/projects/repos/user_repo";\
		user_repo = Projects::Repos::UserRepo.new(Projects::Application[:container]);\
		pp user_repo.all;\
		user_repo.create(first_name: "Michael", last_name: "Milewski", age: 46);\
		pp user_repo.all;\
		pp user_repo.all.first.full_name'

.PHONY: clean
clean:
	dropdb rom_and_dry_dev

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make setup${NC}                     install and setup"
	@echo "${YELLOW}make demo${NC}                      run a demo"
	@echo
	@echo "${YELLOW}make clean${NC}                     clean up"
	@echo