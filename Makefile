# The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment devops
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint which is docker lint tool
# app.py should pass pylint



setup:
	python3 -m venv ~/.devops
   	    source ~/.devops/bin/activate


install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
	    pip install -r requirements.txt
	sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	sudo chmod +x /bin/hadolint

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

all: install lint test