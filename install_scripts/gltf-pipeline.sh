#!/bin/sh

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

cd $DOWNLOAD_DIR

if [ ! -d gltf-pipeline ]; then
  # remove stock nodejs and npm
  echo "Removing default NodeJS and NPM"
  # sudo apt-get purge nodejs && sudo apt-get autoremove && sudo apt-get autoclean

  # install nvm
  echo "Installing NVM and latest NodeJS LTS version"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  nvm install --lts
  nvm use --lts
  npm install -g npm
  npm install gltf-pipeline
fi

# set env var
GLTF_PIPELINE_PATH="${DOWNLOAD_DIR}/gltf-pipeline/node_modules/gltf-pipeline/bin"
cd
echo "export GLTF_PIPELINE_PATH=$GLTF_PIPELINE_PATH" >> .bashrc