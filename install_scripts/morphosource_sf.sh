#!/usr/bin/env bash

# This script setups the MorphoSource_SF hyrax app
source $HOME/.rvm/scripts/rvm

echo
echo 'Setting up MorphoSource_SF'
echo '-------------'

cd /vagrant/MorphoSource_SF

echo 'Install bundler and run bundle install...'

#read -p "Press enter to continue "
gem install bundler
which bundle

#read -p "Press enter to continue "
bundle install --without production

# The following steps will copy changes for supporting Dicom file type
# note that a future update of FITS might create a conflict on exiftool_xslt_map.xml
# in that case, compare the new version of exiftool_xslt_map.xml with the old one, 
# and manually add the DICOM xslt mapping, e.g. : 
#
# 	<map format="DICOM" transform="exiftool_dicom_to_fits.xslt"/>
#
. /vagrant/install_scripts/config
cp vendor/fits_config/fits.xml $FITS_PATH/xml/.
cp vendor/fits_config/exiftool/exiftool_xslt_map.xml $FITS_PATH/xml/exiftool/.
cp vendor/fits_config/exiftool/exiftool_dicom_to_fits.xslt $FITS_PATH/xml/exiftool/.

#read -p "Press enter to continue "
echo 'Copying the role map config file...'
cp config/role_map.yml.sample config/role_map.yml

echo 'creating Postgres db and user for Hydra...'
psql -c "CREATE USER hydra WITH PASSWORD 'hydra' CREATEDB;" postgres
psql -c "CREATE DATABASE development WITH OWNER hydra;" postgres
psql -c "CREATE DATABASE test WITH OWNER hydra;" postgres
rake db:schema:load

echo 'run database migrations...'
rake db:migrate

echo 'load default workflow...'
rake hyrax:workflow:load

echo '-------------'
echo 'Setup completed.  To start the server:'
echo 'bin/rails hydra:server'
echo '-------------'
