#!/bin/sh

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -d fiji ]; then
  DOWNLOAD_URL="https://downloads.imagej.net/fiji/latest/fiji-linux64.zip"
  cd $DOWNLOAD_DIR
  if [ ! -f "fiji-linux64.zip" ]; then
    echo "Downloading $DOWNLOAD_URL"
    curl -sS $DOWNLOAD_URL -o fiji-linux64.zip
  fi
  mkdir fiji
  unzip fiji-linux64.zip -d fiji

  FIJI_PATH="${DOWNLOAD_DIR}/fiji"
  cd
  echo "export FIJI_PATH=$FIJI_PATH" >> .bashrc
fi