#!/bin/sh

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -d blender ]; then
  DOWNLOAD_URL="https://download.blender.org/release/Blender2.79/blender-2.79b-linux-glibc219-x86_64.tar.bz2"
  cd $DOWNLOAD_DIR
  if [ ! -f "blender.tar.bz2" ]; then
    echo "Downloading $DOWNLOAD_URL"
    curl -sS $DOWNLOAD_URL -o blender.tar.bz2
  fi
  tar xjf blender.tar.bz2
  mv blender-2.79b-linux-glibc219-x86_64 blender

  BLENDER_PATH="${DOWNLOAD_DIR}/blender"

  #cp -r $SHARED_DIR/install_scripts/blender_config/scripts $BLENDER_PATH/.
  #chmod a+x $BLENDER_PATH/scripts/*
  cp -r $SHARED_DIR/install_scripts/blender_config/addons/io_scene_gltf2 $BLENDER_PATH/2.79/scripts/addons/

  cd
  echo "export BLENDER_PATH=$BLENDER_PATH" >> .bashrc
  echo "PATH=\${PATH}:$BLENDER_PATH" >> .bashrc
fi

# shared library needed
# from https://blender.stackexchange.com/questions/96020/libglu-so-1-error-loading-shared-library/102122
sudo apt-get install libglu1
