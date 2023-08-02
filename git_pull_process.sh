#!/bin/bash

for dir in ./*/
do
  cd ${dir}
  git status >/dev/null 2>&1
  # check if exit status of above was 0, indicating we're in a git repo
  [ $(echo $?) -eq 0 ] && printf "Updating ${dir%*/}...\n###\n###\n###\n" && git pull
  cd ..
done
