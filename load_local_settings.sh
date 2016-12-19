#!/bin/bash
# Loads local settings into this directory
echo "Loading local settings..."
for x in `ls -A profile_customization/`; do
  cp ~/$x profile_customization/
  echo "... $x"
done
echo "done"
