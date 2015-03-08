#!/bin/bash
## on sift3, describe install and setup of dfirnotes on IPython 2.x

## edit for your install
siftuser=sosift # sansforensics

echo "These commands will install dependencies for IPython notebooks with sudo rights:"
echo sudo apt-get install python-matplotlib python-matplotlib-doc python-pandas pandoc 
echo sudo pip install --upgrade pyzmq tornado jinja pygments

## create an ipython profile for dfirnotes
echo "This will create an IPython profile for DFIRnotes configuration and content:"
echo ipython profile create dfirnotes

## pull in any custom CSS or image files
toolbar_logo=https://raw.githubusercontent.com/adricnet/dfirnotes/master/logo/dfirnotes_bare_logo_50.png
ipy_logo_file=/usr/local/lib/python2.7/dist-packages/IPython/html/static/base/images/ipynblogo.png
echo "Backup the upstream IPython logo by renaming"
echo sudo mv $ipy_logo_file $ipy_logo_file.dist
echo "Pull in DFIRnotes logo from Github, replace IPython logo" 
echo curl -k $toolbar_logo > /tmp/tempimage
echo sudo mv /tmp/tempimage $ipy_logo_file

#### offline Reveal.js
##To specify a non-localhost port use ipython profile config files

##vi ~/.ipython/profile_default/ipython_nbconvert_config.py

## port for the server to listen on.
## c.ServePostProcessor.port = 8000
#c.ServePostProcessor.port = 8888

## The IP address to listen on.
## c.ServePostProcessor.ip = '127.0.0.1'
#c.ServePostProcessor.ip = '192.168.15.105'

### To get them working local / offline clone reveal.js 
### and install other nodejs pkgs and then tell nbconvert to use local reveal

git clone https://github.com/hakimel/reveal.js.git
cd reveal.js ; npm install    

## Invoke with
echo "Run a slideshow from a saved notebook with:"
echo ipython nbconvert --to slides --post serve --reveal-prefix=reveal.js/ rekal-slides-test.ipynb 

## 

## Volatility profiles

## Rekall profiles