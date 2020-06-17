#!/bin/bash

# Site build script
#
# @date: 2020-06-15 14:43
# @author: Shashank Sharma
# @usage: ./build.sh

STATUS=`git status --porcelain`
WEBROOT=`pwd`

# check for index changes before
# checking out to the gh-pages
if [[ ! $STATUS ]]; then

  jekyll build
  git checkout gh-pages
  cp -r _site/ $WEBROOT
  rm -r _site
  # open /Applications/GitHub.app
  git diff
  git add .
  git commit -m "site build"
  git push origin master
  git checkout pre-build
  git push origin pre-build
  exit;

else
  echo "has to commit changes before site build "
  exit;
fi
