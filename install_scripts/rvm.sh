#!/usr/bin/env bash

# See https://rvm.io/integration/vagrant

echo
echo 'check for rvm'
echo '-------------'
cd
if [ -e /home/ubuntu/.rvm/scripts/rvm ]; then
    echo 'rvm already installed'
    source /home/ubuntu/.rvm/scripts/rvm
else
    echo 'installing rvm'
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s $1
    source /home/ubuntu/.rvm/scripts/rvm
    rvm requirements
fi
echo
