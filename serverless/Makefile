.DEFAULT_GOAL := usage

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
MAGENTA = \033[0;35m
NC      = \033[0m

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

.PHONY: check-tools
check-tools:
	@command -v brew && \
		echo "${GREEN}✅ brew installed${NC}" || \
		echo "${YELLOW}no brew - you on your own${NC}"
	@cargo --version | grep 1.73.0 > /dev/null && \
		echo "${GREEN}✅ rust ready${NC}" || \
		echo "${YELLOW}no rust${NC}"
	@bash -c 'cargo lambda --version | grep 1.2.1 > /dev/null && \
		echo -e "${GREEN}✅ cargo lambda ready${NC}" || \
		echo -e "${YELLOW}no cargo lambda${NC}"'
	@bash -c '${HOMEBREW_PREFIX}/bin/sam --version | grep 1.116.0 > /dev/null && \
		echo -e "${GREEN}✅ sam ready${NC}" || \
		echo -e "${YELLOW}no sam${NC}"'

	@bash -c 'LESS=-FR aws codeconnections list-hosts > /dev/null && \
		echo -e "${GREEN}✅ aws connected${NC}" || \
		echo -e "\n\t${YELLOW}❌ make sure to ${RED}aws configure${NC}\n"'

.PHONY: install
install: check-tools
	brew bundle
	@echo "${YELLOW}might need to do a ${GREEN}brew bundle${YELLOW} outside of make context${NC}"

.PHONY: demo
demo:
	@echo "demo"

.PHONY: clean-build
clean-build:
	@rm -rf rust_app/target

.PHONY: clean
clean: clean-build

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make${NC}                     this handy usage guide"
	@echo "${YELLOW}make install${NC}             install and check tools"
	@echo
