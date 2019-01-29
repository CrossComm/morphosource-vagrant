#!/bin/sh

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -d /opt/firefox ]; then
  DOWNLOAD_URL="https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2"
  cd $DOWNLOAD_DIR
  if [ ! -f "firefox.tar.bz2" ]; then
    echo "Downloading $DOWNLOAD_URL"
    curl -sS $DOWNLOAD_URL -o firefox.tar.bz2
  fi
  tar xjf firefox.tar.bz2
  sudo mv firefox /opt/firefox
fi
