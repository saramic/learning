usage:
	bin/makefile/usage

check-tools:
	bin/makefile/check-tools

dev-env: check-tools
	bin/makefile/dev-env

update-dev-env:
	bin/makefile/dev-env --update

resume-to-pdf:
	pip install md2pdf && \
		md2pdf RESUME.md RESUME.Michael_Milewski.`date +%Y%m%d`.pdf && \
		open RESUME.Michael_Milewski.`date +%Y%m%d`.pdf

