usage:
	bin/makefile/usage

check-tools:
	bin/makefile/check-tools

dev-env: check-tools
	bin/makefile/dev-env

update-dev-env:
	bin/makefile/dev-env --update
