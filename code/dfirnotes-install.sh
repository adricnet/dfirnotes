#!/bin/bash
## on sift3, install required deb and pip packages for dfirnotes

sudo apt-get install python-matplotlib python-matplotlib-doc python-pandas pandoc 
sudo pip install --upgrade pyzmq tornado jinja pygments

## create an ipython profile for dfirnotes
ipython profile create dfirnotes

## pull in any custom CSS or image files
toolbar_logo = https://raw.githubusercontent.com/adricnet/dfirnotes/master/logo/dfirnotes_bare_logo_50.png
curl -k $toolbar_logo >  
