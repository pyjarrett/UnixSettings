#!/bin/bash
INSTALL_DIR=`echo ~`
echo "Loading profile_customization into $INSTALL_DIR"
echo "Installing the following customization files:"
ls -1A profile_customization
cp -R profile_customization/ ~

# Reload the new configuration into bash
echo
echo "Reloading bash profile."
source ~/.bash_profile
