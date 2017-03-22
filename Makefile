SHELL=/bin/bash
VENV_NAME=venv
CSS_DIR=css
JS_DIR=js

VENV_ACTIVATE=./$(VENV_NAME)/*/activate

# if `python` command is Python 3, use that, otherwise attempt to use `python3`
ifeq ($(shell python --version | sed -e 's/Python\s\([0-9]\).*/\1/'),3)
PYTHON=python
else
PYTHON=python3
endif


.PHONY: help pip-install pip-uninstall configure clean run stop

.DEFAULT_GOAL := help

# this brilliant bit taken from http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Show this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

configure: ## set up production environment (python virtualenv, bower/npm/pip)
	npm install
	bower install
	$(PYTHON) -m pip install virtualenv
	$(PYTHON) -m virtualenv -v $(VENV_NAME)
	source $(VENV_ACTIVATE) && pip install -r requirements.txt && deactivate

clean: ## clean up all files not tracked by git (i.e. build artifacts)
	git clean -fx


pip-install: ## add a package to the python virtual environment. usage: make pip-install PKG=<package name>
	source $(VENV_ACTIVATE) && pip install $(PKG) && pip freeze > requirements.txt && deactivate

pip-uninstall:  ## remove a package from the python virtual environment. usage: make pip-uninstall PKG=<package name>
	# usage: make pip-uninstall PKG=<package name>
	source $(VENV_ACTIVATE) && pip uninstall $(PKG) && pip freeze > requirements.txt && deactivate

run: ## start webserver
	./site.sh & echo $$! > site.pid

stop: ## stop webserver
	kill $$(cat *.pid) && rm *.pid
