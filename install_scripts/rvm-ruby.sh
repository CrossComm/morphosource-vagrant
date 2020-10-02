#!/usr/bin/env bash

source $HOME/.rvm/scripts/rvm

#
# check for ruby 2.6
#
echo
echo 'check for ruby 2.6'
echo '--------------------'
ruby_version="$(rvm list 2>&1)"
if echo $ruby_version | grep -q 'ruby-2.6'; then
    echo 'ruby 2.6 already installed'
else
    echo 'installing ruby 2.6'
    rvm install 2.6
fi
echo
