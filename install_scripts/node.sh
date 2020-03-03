#!/bin/sh

echo "Setting up NPM/Node for downstream provision scripts"

cd $HOME
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#  downgrade node JS to 10.16.3 because of ES module error.  Match node version with dev/demo
#  https://github.com/CesiumGS/gltf-pipeline/issues/507
#nvm install --lts
#nvm use --lts
nvm install 10.16.3
nvm use 10.16.3
npm install -g npm


