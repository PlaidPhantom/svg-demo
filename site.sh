#!/bin/bash

source ./venv/*/activate

exec python site.py $@

deactivate
