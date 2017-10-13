#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

UBUNTU_CODENAME=$(lsb_release -s -c)	#Xenial
UBUNTU_VERSION=$(lsb_release -rs)	#16.04

# PIP3 LIST
PIP3_LIST=(
	beautifulsoup4
	Jinja2
	matplotlib
	numpy
	scipy
	sympy
)

APP3_LIST=(
	python3-nmap
	python3-pygraphviz
	python3-requests
	python3-tk
)

main()
{
	apt_update
	clear

	echo "Installing apps now ..."
	sudo apt-get -y install "${APP3_LIST[@]}"

	echo "Installing pip3 apps"	
	sudo -H pip3 install "${PIP3_LIST[@]}"

}

apt_update()
{
	echo "update..."
	apt-get update
	clear
	echo "update pip3..."
	sudo -H pip3 install --upgrade pip
}


main