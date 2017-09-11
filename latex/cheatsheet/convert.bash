#! /bin/bash

convert -density 300 Ubuntu_14_cheatsheet.pdf[0] image.jpg
gsettings set org.gnome.desktop.background picture-uri file:////home/wqkhan/Documents/git/ubuntu/latex/cheatsheet/image.jpg
#feh -bg-scale /home/wqkhan/Documents/git/ubuntu/latex/cheatsheet/image.jpg
