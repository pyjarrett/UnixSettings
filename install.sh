#!/bin/sh
echo "Loading profile_customization into ~"
echo "Installing the following customization files"
ls -Ra profile_customization
cp -R profile_customization ~

# Reload the new configuration into bash
source ~/.bash_profile
