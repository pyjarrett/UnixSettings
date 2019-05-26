#!/usr/bin/python
import os

save_dir = 'profile_customization'
saved_dotfiles = os.listdir(save_dir)
print("Saved settings for:")
for filename in saved_dotfiles:
    print(f'... {filename}')
print()

home_dir = os.path.expanduser('~')
home_dotfiles = [x for x in os.listdir(home_dir) if x.startswith('.') and os.path.isfile(os.path.join(home_dir, x))]

untracked_dotfiles = [x for x in home_dotfiles if x not in saved_dotfiles]
known_dotfiles = [x for x in home_dotfiles if x in saved_dotfiles]
missing_dotfiles = [x for x in saved_dotfiles if x not in home_dotfiles]

print('Known:')
for filename in known_dotfiles:
    print(f'... {filename}')
print()

print('Missing:')
for filename in missing_dotfiles:
    print(f'... {filename}')
print()

print('Untracked:')
for filename in untracked_dotfiles:
    print(f'... {filename}')
print()

