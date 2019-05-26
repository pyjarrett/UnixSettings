#!/usr/bin/python3
#
# Installs dotfiles
# 
from distutils.util import strtobool
import os
import shutil
import sys

def override_file(filename):
    try:
        return strtobool(input(f'Overrite {filename} [y/n]? '))
    except ValueError:
        return False

print('Installing settings from repo')

home_dir = os.path.expanduser('~')
save_dir = 'profile_customization'
saved_dotfiles = os.listdir(save_dir)

for filename in saved_dotfiles:
    src = os.path.join(save_dir, filename)
    dst = os.path.join(home_dir, filename)

    if os.path.exists(dst) and not override_file(dst):
        print(f'Skipping {filename}')
        continue

    sys.stdout.write(f'Copying {filename} ... ')
    written_file = shutil.copy(src, dst)

    if not os.path.exists(written_file):
        print('failed')
    else:
        print('done')

