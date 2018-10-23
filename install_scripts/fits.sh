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
  # The following steps will copy changes for supporting Dicom file type
  # note that a future update of FITS might create a conflict on exiftool_xslt_map.xml
  # in that case, compare the new version of exiftool_xslt_map.xml with the old one, 
  # and manually add the DICOM xslt mapping, e.g. : 
  #
  # 	<map format="DICOM" transform="exiftool_dicom_to_fits.xslt"/>
  #
  cp $SHARED_DIR/install_scripts/fits_config/exiftool_xslt_map.xml $FITS_PATH/xml/exiftool/.
  cp $SHARED_DIR/install_scripts/fits_config/exiftool_dicom_to_fits.xslt $FITS_PATH/xml/exiftool/.
  #
  cd
  echo "PATH=\${PATH}:$FITS_PATH" >> .bashrc
fi

