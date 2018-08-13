#!/bin/sh

# FITS
SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -d fits-$FITS_VERSION ]; then
  DOWNLOAD_URL="http://projects.iq.harvard.edu/files/fits/files/fits-${FITS_VERSION}.zip"
  cd $DOWNLOAD_DIR
  if [ ! -f "fits.zip" ]; then
    curl $DOWNLOAD_URL -o fits.zip
  fi
  # latest fits zip does not include a fits directory, we need to create one
  mkdir fits-$FITS_VERSION
  unzip fits.zip -d fits-$FITS_VERSION
  chmod a+x fits-$FITS_VERSION/*.sh
  FITS_PATH="${DOWNLOAD_DIR}/fits-${FITS_VERSION}"
  cd
  echo "PATH=\${PATH}:$FITS_PATH" >> .bashrc
fi

