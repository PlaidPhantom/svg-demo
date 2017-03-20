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


.PHONY: pip-install pip-uninstall configure clean run stop

pip-install:
	# usage: make pip-install PKG=<package name>
	source $(VENV_ACTIVATE) && pip install $(PKG) && pip freeze > requirements.txt && deactivate

pip-uninstall:
	# usage: make pip-uninstall PKG=<package name>
	source $(VENV_ACTIVATE) && pip uninstall $(PKG) && pip freeze > requirements.txt && deactivate

configure:
	npm install
	virtualenv -v -p $$(which $(PYTHON)) $(VENV_NAME)
	source $(VENV_ACTIVATE) && pip install -r requirements.txt && deactivate

clean:
	rm -f $(CSS_DIR)/*.css
	rm -f $(JS_DIR)/*.js


run:
	./site.sh & echo $$! > site.pid

stop:
	kill $$(cat *.pid) && rm *.pid
