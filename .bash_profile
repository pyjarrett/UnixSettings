################################################################################
#                                       Prompt changes
#  
# Change the command line prompt
################################################################################
# My old style prompt
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;36m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#PS1='\n \[\e[0;32m\]\u\[\e[m\] \[\e[1;36m\]\w\[\e[m\] :\n [\@] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
PS1='\n \[\e[0;32m\]\u\[\e[m\]@\H \[\e[1;36m\]\w\[\e[m\] :\n [\d \@] \n\n \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'


# \u User name
# \w Full path
# \\a an ASCII bell character (07)
#\d the date in "Weekday Month Date" format (e.g., "Tue May 26")
#\D{format} - the format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required
#\e an ASCII escape character (033)
#\h the hostname up to the first part
#\H the hostname
#\j the number of jobs currently managed by the shell
#\l the basename of the shell's terminal device name
#\n newline
#\r carriage return
#\s the name of the shell, the basename of $0 (the portion following the final slash)
#\t the current time in 24-hour HH:MM:SS format
#\T the current time in 12-hour HH:MM:SS format
#\@ the current time in 12-hour am/pm format
#\A the current time in 24-hour HH:MM format
#\u the username of the current user
#\v the version of bash (e.g., 2.00)
#\V the release of bash, version + patch level (e.g., 2.00.0)
#\w the current working directory, with $HOME abbreviated with a tilde
#\W the basename of the current working directory, with $HOME abbreviated with a tilde
#\! the history number of this command
#\# the command number of this command
#\$ if the effective UID is 0, a #, otherwise a $
#\nnn the character corresponding to the octal number nnn
#\\ a backslash
#\[ begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
#\] end a sequence of non-printing character






################################################################################
#
#                                       MacPorts  
#
# Your previous /Users/pauljarrett/.bash_profile file was backed up as
# /Users/pauljarrett/.bash_profile.macports-saved_2010-10-16_at_19:57:42
#
# MacPorts Installer addition on 2010-10-16_at_19:57:42: adding an appropriate PATH variable for use with MacPorts.
# Finished adapting your PATH environment variable for use with MacPorts.
################################################################################
export PATH=/opt/local/bin:/opt/local/sbin:$PATH



################################################################################
#
#                                       Subversion
#  
# Subversion additions to make SVN sane.
#
################################################################################
export SVN_EDITOR=vi
export PATH=/opt/subversion/bin/:$PATH



################################################################################
# 
#                                       ALIASES  
#
################################################################################

# Use colors when outputting for ls
alias ls='ls -G'

# Allow jumping to my master code checkout repository
alias masterCodeDirectory='cd ~/Documents/Development/Master\ Code/'

# Immediately open namespace list from master code
alias daesDocs='open file:///Users/pauljarrett/Documents/Development/Master%20Code/docs/html/namespaces.html'


################################################################################
#                                       MAC_VIM (MAKING IT BEHAVE LIKE GVIM)   
################################################################################
# Set target directory variable for mvim script
export VIM_APP_DIR=/Applications/

# Call mvim startup script in /usr/local/bin/
alias gvim='mvim'

################################################################################
#
#                                       Working with Finder 
#
################################################################################
# Cd to the current top finder window
function ff { osascript -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "get POSIX path of (target of window ${1-1} as alias)"\
 -e 'else' -e 'get POSIX path of (desktop as alias)'\
 -e 'end if' -e 'end tell'; };\

function cdff { cd "`ff $@`"; };

alias ls='ls -G'
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias egrep='egrep --color'

export PATH=$PATH:/opt/local/bin
export DOXYGEN_PATH=/Applications/Doxygen.app/Contents/Resources/doxygen
export PROJECT_HOME=/Users/jarrett/Projects/

# Simple prompt.
#export PS1="\n[\u@\h \W]\$ "
export PS1="\n---------------------------------------------------------------------------\n\u \A \n\W/\n\$ "

# Removed to see if it will break anything.
#export VIM_APP_DIR=/Applications/


