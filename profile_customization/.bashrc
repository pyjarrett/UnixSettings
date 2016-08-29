################################################################################
#                                       Prompt changes
# Change the command line prompt
################################################################################
# My old style prompt
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;36m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#PS1='\n \[\e[0;32m\]\u\[\e[m\] \[\e[1;36m\]\w\[\e[m\] :\n [\@] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
# Simple prompt.
#export PS1="\n[\u@\h \W]\$ "
#export PS1='\n \[\e[0;32m\]\u\[\e[m\]@\H \[\e[1;36m\]\w\[\e[m\] :\n [\d \@] \n\n \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]' 
#export PS1='\n\u@\h \n\w\n ! \! $ '
#export PS1='\n \e[1;95m \u@\h \e[0;32m\w \n $ \e[0;30m'

# Prompt is:
#  USER@HOST DIRECTORY
#    (X files, X Kb)
#  $ 
#
#export PS1='\n \e[1;95m \u@\h \e[0;32m\w \e[1;95m \n    (`ls -1 | wc -l | sed "s: ::g"` files, `ls -lah | grep -m 1 total | sed "s/total //"`Kb) \n $ \e[0;30m'
source ~/.git-prompt.sh
#export PS1='\n \e[1;95m \u@\h \e[0;32m\w \e[1;95m \n    \e[0;32m $ \e[0;30m '

# Prompt shows current login, current dir, (git branch), number/size of files in dir.
# 
#  paul@Pauls-MacBook-Pro ~/UnixSettings   (master) 
#  (4 files,16Kb) 
# $ 

# export PS1='\n \e[1;95m \u@\h \e[0;32m\w \e[1;30m $(__git_ps1 " (%s)" ) \n \e[1;95m (`ls -l | wc -l | sed "s: ::g"` files, `ls -lah | grep -m 1 total | sed "s/total //"`Kb) \@ \n $ \e[0;30m'

export PS1='\n \[\e[1;95m\] \u@\h \[\e[0;32m\]\w \[\e[1;30m\] $(__git_ps1 " (%s)" ) \n \[\e[1;95m\] \@ \n $ \[\e[0;30m\]'

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
#                                 OS SPECIFIC SETTINGS                                    
#
################################################################################
if [ $OSTYPE == "Linux" ]
then :
else
    # Update paths because mac can't store things in simple locations
    alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
    # Searches for MacPorts programs 
    export PATH=~/Projects/halign/:~/Projects/Jarvis/:~/.cargo/bin:$PATH
fi


################################################################################
# 
#                                       ALIASES  
#
################################################################################

# Use colors when outputting for ls
alias ls='ls -G'

# Allow egrep to print in color
alias egrep='egrep --color'

# Override Mac's vim 7.3 using MacVim's 7.4
# Using symlinkk instead
# alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH
# :/Library/Python/2.7/site-packages/


# Add directories to a history file. I intend to use this file to establish a
# path history to determine where I go.
#alias cd='pwd >> ~/.dirhistory; cd '
# ls immediately after changing directories.
function cd { builtin cd "$@" && ls -F; }

alias tags_local_cpp_build='find . -name "*.hpp" -o -name "*.cc" -o -name "*.c" -o -name "*.cpp" -o -name "*.h" -exec etags -a -o tags {} \;'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
set editor-mode vi
set -o vi
