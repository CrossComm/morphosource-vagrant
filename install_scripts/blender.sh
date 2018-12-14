#!/bin/sh

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

DOWNLOAD_URL="https://www.blender.org/download/Blender2.79/blender-2.79b-linux-glibc219-x86_64.tar.bz2"
cd $DOWNLOAD_DIR
if [ ! -f "blender.tar.bz2" ]; then
  curl $DOWNLOAD_URL -o blender.tar.bz2
fi
tar xjf blender.tar.bz2
sudo mv blender $DOWNLOAD_DIR/.

BLENDER_PATH="${DOWNLOAD_DIR}/blender"
cp -r $SHARED_DIR/install_scripts/blender_config/scripts $BLENDER_PATH/.
chmod -r a+x $BLENDER_PATH/scripts

cd
echo "EXPORT BLENDER_PATH=$BLENDER_PATH" >> .bashrc
