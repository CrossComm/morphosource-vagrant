#!/bin/sh

echo "Installing necessary Python modules for MorphoSourceSF"

cd
echo "Alias test"
echo "$(cat .bashrc | grep 'python')"

if echo "$(cat .bashrc | grep 'python')"; then
  echo "Skip python alias"
else
  echo "Creating alias python3 to python"
  echo "alias python=python3" >> .bashrc
fi

sudo python3 -m pip install numpy
echo "Check numpy Installation"
python3 -c 'import numpy; print(numpy.__version__)'

sudo python3 -m pip install Pillow
echo "Check PIL Installation"
python3 -c 'import PIL; print(PIL.__version__)'

sudo python3 -m pip install pydicom
echo "Check pydicom Installation"
python3 -c 'import pydicom; print(pydicom.__version__)'




