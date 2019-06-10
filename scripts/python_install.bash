#!/bin/bash

# set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

UBUNTU_CODENAME=$(lsb_release -s -c)	#bionic
UBUNTU_VERSION=$(lsb_release -rs)	#18.04

# PIP3 LIST
PIP3_LIST=(
	beautifulsoup4
	color
	dplython
	GitPython
	gtabview
	html5lib
	Jinja2
	jupyter
	matplotlib
	nltk
	numpy
	pandas
	plotly psutil
	plotnine          # https://github.com/has2k1/plotnine
	preprocessing
	# psycopg2
	pydotplus
    pyshark
	quandl
	redis
	scipy
	scikit-learn
	seaborn
	sympy
	tensorflow
	unicodecsv
	virtualenv
)

APP3_LIST=(
	python3-automaton
	python3-dev
	python3-nmap
	python3-pygraphviz
	python3-requests
	python3-tk
)

pip_update()
{
	echo "update..."
	apt update
	clear
	echo "update pip..."
	sudo -H pip3 install --upgrade pip
	sudo -H pip2 install --upgrade pip
}

upgrade_modules()
{
	echo "Upgrading modules ..."
	sudo pip3 install --upgrade "${PIP3_LIST[@]}"
}

main()
{
	pip_update
	clear


	echo "Installing apps now ..."
	sudo apt -y install "${APP3_LIST[@]}"

	echo "Installing pip3 apps"	
	sudo -H pip3 install "${PIP3_LIST[@]}"

	upgrade_modules
}

main
