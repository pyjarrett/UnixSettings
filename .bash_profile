################################################################################
#                                       Prompt changes
#  
# Change the command line prompt
################################################################################
# My old style prompt
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;36m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#PS1='\n \[\e[0;32m\]\u\[\e[m\] \[\e[1;36m\]\w\[\e[m\] :\n [\@] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
# Simple prompt.
#export PS1="\n[\u@\h \W]\$ "

if [ $USER == "pauljarrett" ] # Desktop specific settings
then
    # My desktop terminal is black... this makes it easier to read.
    export PS1='\n \[\e[0;32m\]\u\[\e[m\]@\H \[\e[1;36m\]\w\[\e[m\] :\n [\d \@] \n\n \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]' 
else
    # I use a sand-colored laptop terminal
    export PS1="\n---------------------------------------------------------------------------\n\u \A \n\W/\n\$ "
fi

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
################################################################################
export PATH=/opt/local/bin:/opt/local/sbin:~/Projects/enzyme/:$PATH
export DOXYGEN_PATH=/Applications/Doxygen.app/Contents/Resources/doxygen


################################################################################
# 
#                                       ALIASES  
#
################################################################################

# Use colors when outputting for ls
alias ls='ls -G'
alias egrep='egrep --color'
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
