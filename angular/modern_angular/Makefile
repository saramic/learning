.DEFAULT_GOAL := usage

.PHONY: install
install:
	npm install -g @angular/cli

hrms:
	ng new hrms \
		--defaults \
		--standalone \
		--routing
12_days:
	ng new 12_days \
		--minimal \
		--defaults \
		--standalone \
		--routing

.PHONY: usage
usage:
	@echo "make install                install angular cli"
	@echo
	@echo "make hrms                   create app (one off)"
	@echo "make twelve_days            create minimal app (one off)"
