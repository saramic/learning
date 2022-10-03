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
	rails db:migrate

.PHONY: demo
demo:
	bundle exec rails r '\
		puts "${YELLOW}fetch projects id: 1${NC}";\
		puts "${GREEN}" + ROM.env.relations[:projects].by_pk(1).one.inspect + "${NC}";\
		time = Time.now.to_i;\
		puts "${YELLOW}create a project using the repository${NC}";\
		repo = ProjectRepository.new(ROM.env);\
		project = repo.create(name: "Test Project");\
		begin;\
		  puts "${YELLOW}attempt to make a new project with wrong type for :name${NC}";\
			project2 = Projects::Project.new(name: 1);\
		rescue => e;\
		  puts "${RED}" + e.message + "${NC}";\
		end;\
		puts "${YELLOW}fetch projects id: 1 to show it was created${NC}";\
		puts "${GREEN}" + ROM.env.relations[:projects].by_pk(1).one.inspect + "${NC}";\
		project = Projects::Project.new(created_at: time);\
		begin;\
			puts "${YELLOW}Project.all not yet implemented${NC}";\
			puts "${GREEN}" + Projects::Project.all.inspect + "${NC}";\
		rescue => e;\
		  puts "${RED}" + e.message + "${NC}";\
		end;\
		begin;\
			puts "${YELLOW}project.name= is undefined as we cannot change it${NC}";\
			project.name = "Test Project #2";\
		rescue => e;\
		  puts "${RED}" + e.message + "${NC}";\
		end;'

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