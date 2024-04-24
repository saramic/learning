.DEFAULT_GOAL := usage

.PHONY: install
install:
	npm install -g @angular/cli

ng-dev-home-app:
	ng new ng-dev-home-app \
		--defaults \
		--standalone \
		--routing

.PHONY: usage
usage:
	@echo "make install                install angular cli"
	@echo
	@echo "make ng-dev-home-app        angular.dev tutorial app"
