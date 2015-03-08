#!/bin/bash
## dfirnotes sample minimal new case script

## Defaults from dfirnotes on sift3, change to suit
ipy = /usr/bin/ipython2.7
ipy_profile = dfirnotes
cases_root = /cases
## if you don't use ip you get localhost only, port defaults to 8888
srv_ip=192.168.15.109

## with no arguments generate a case folder from date
datestamp=$(date +%Y%m%d) ## 20150308
new_case = $cases_root/$datestamp
echo "Making new case folder" $new_case
mkdir $new_case

## here you could copy in notebook(s) from templates 
## cp "~/f/dfirnotes/dfirNote win5mem TEMPLATE.ipynb" $new_case/

## start notebook server in offline mode in case folder
$ipy notebook --profile $ipy_profile --no-mathjax \
 --no-browser --ip $srv_ip --notebook-dir $new_case
