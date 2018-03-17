#!/bin/bash

# set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

UBUNTU_CODENAME=$(lsb_release -s -c)	#Xenial
UBUNTU_VERSION=$(lsb_release -rs)	#16.04

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
	numpy
	pandas
	plotly
	preprocessing
	psycopg2
	pydotplus
    pyshark
	redis
	scipy
	scikit-learn
	seaborn
	sympy
	unicodecsv
	virtualenv
)

APP3_LIST=(
	python3-automaton
	python3-nmap
	python3-pygraphviz
	python3-requests
	python3-tk
)

pip_update()
{
	echo "update..."
	apt-get update
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
	sudo apt-get -y install "${APP3_LIST[@]}"

	echo "Installing pip3 apps"	
	sudo -H pip3 install "${PIP3_LIST[@]}"

	upgrade_modules
}

main
