#!/usr/bin/python3
#
# Grabs local versions of the known dotfiles.
# 
import os
import shutil
import sys

print("Saving settings into repo.")

home_dir = os.path.expanduser('~')
save_dir = 'profile_customization'
saved_dotfiles = os.listdir(save_dir)

for filename in saved_dotfiles:
    src = os.path.join(home_dir, filename)
    dst = os.path.join(save_dir, filename)

    if not os.path.exists(src):
        print(f'No local version of {filename} exists')
        continue

    if not os.path.isfile(src):
        print('Unable to copy {src}')
        continue

    sys.stdout.write(f'Copying {filename} ... ')
    written_file = shutil.copy(src, dst)

    if not os.path.exists(written_file):
        print('failed')
    else:
        print('done')

