#!/usr/bin/env bash

# This script setups the MorphoSource_SF hyrax app
source $HOME/.rvm/scripts/rvm

echo
echo 'Setting up MorphoSource_SF'
echo '-------------'

cd /vagrant/MorphoSource_SF

echo 'Copying the role map config file...'
cp config/role_map.yml.sample config/role_map.yml

echo 'Install bundler and run bundle install...'
sudo gem install bundler
bundle install --without production

echo 'run database migrations...'
rake db:migrate

echo 'load default workflow...'
rake hyrax:workflow:load

echo '-------------'
echo 'Setup completed.  To start the server:'
echo 'vagrant ssh'
echo 'cd /vagrant/MorphoSource_SF'
echo 'bin/rails hydra:server'
echo '-------------'
