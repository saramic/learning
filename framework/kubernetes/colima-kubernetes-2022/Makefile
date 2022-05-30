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
	brew bundle
	colima start --with-kubernetes -r docker

.PHONY: setup
setup: install
	docker build -t simple-node-server .
	docker run --name simple-node-server-container \
		-d -p 8081:80 -e HOST=0.0.0.0 -e PORT=80 simple-node-server
	kubectl create ns simple-app
	kubectl apply -f deployment.yaml -n simple-app

.PHONY: demo
demo:
	@echo "${GREEN}using docker image on 8081${NC}"
	curl http://localhost:8081
	@echo "\n${GREEN}using k8s image on a given port${NC}"
	kubectl get svc -n simple-app simple-node-server -o json | jq '.spec.ports[0].nodePort' | \
		xargs -I{} curl http://localhost:{}

.PHONY: clean
clean:
	docker stop simple-node-server-container
	docker container stop simple-node-server-container
	docker container rm simple-node-server-container
	@echo "${RED}need to work out how to un-apply kubectl deployment, to remove --force below.${NC}"
	docker rmi --force simple-node-server
	kubectl delete ns simple-app
	colima stop

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make setup${NC}                install and setup"
	@echo
	@echo "${YELLOW}make demo${NC}                 run demo"
	@echo
	@echo "${YELLOW}make clean${NC}                tear down"
	@echo
