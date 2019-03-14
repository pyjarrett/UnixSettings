################################################################################
#                          PROMPT CHANGES
################################################################################
# \u User name
# \w Full path
# \\a an ASCII bell character (07)
# \d the date in "Weekday Month Date" format (e.g., "Tue May 26")
# \D{format} - the format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required
# \e an ASCII escape character (033)
# \h the hostname up to the first part
# \H the hostname
# \j the number of jobs currently managed by the shell
# \l the basename of the shell's terminal device name
# \n newline
# \r carriage return
# \s the name of the shell, the basename of $0 (the portion following the final slash)
# \t the current time in 24-hour HH:MM:SS format
# \T the current time in 12-hour HH:MM:SS format
# \@ the current time in 12-hour am/pm format
# \A the current time in 24-hour HH:MM format
# \u the username of the current user
# \v the version of bash (e.g., 2.00)
# \V the release of bash, version + patch level (e.g., 2.00.0)
# \w the current working directory, with $HOME abbreviated with a tilde
# \W the basename of the current working directory, with $HOME abbreviated with a tilde
# \! the history number of this command
# \# the command number of this command
# \$ if the effective UID is 0, a #, otherwise a $
# \nnn the character corresponding to the octal number nnn
# \\ a backslash
# \[ begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
# \] end a sequence of non-printing character
################################################################################
if [ -f ~/.git-prompt.sh ]
then :
  source ~/.git-prompt.sh
  export PS1='\n \[\e[1;95m\] \u@\h \[\e[0;32m\]\w \[\e[1;30m\] $(__git_ps1 " (%s)" ) \n \[\e[1;95m\] \@ \n $ \[\e[0;39m\]'
else :
  export PS1='\n \[\e[1;95m\] \u@\h \[\e[0;32m\]\w \n \[\e[1;95m\] \@ \n $ \[\e[0;39m\]'
fi

################################################################################
#
#                                 EDIT
#
################################################################################
set editor-mode vi
set -o vi

################################################################################
#
#                                 OS SPECIFIC SETTINGS
#
################################################################################

# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
case "$(uname -s)" in
  Linux)
	# Use colors when outputting for ls
	alias ls='ls --color=always'
	;;

  # I don't use mac right now, but in case I need to again.
  Darwin)
    # Update paths because mac can't store things in simple locations
    alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

	# Force screen locking
    alias lock='pmset displaysleepnow'

    # Use colors when outputting for ls
    alias ls='ls -G'
	;;

  CYGWIN*|MINGW32*|MSYS*)
	;;

  *)
	echo 'Unknown OS'
	;;
esac

################################################################################
#
#                                     ALIASES
#
################################################################################
alias egrep='egrep --color'
alias tmux='tmux -2'

alias git-dog='git log --all --decorate --oneline --graph'
alias git-y-diff='git difftool -y -x "colordiff -y -W $COLUMNS" | less -R'

alias tags_local_cpp_build='find . -name "*.hpp" -o -name "*.cc" -o -name "*.c" -o -name "*.cpp" -o -name "*.h" -exec etags -a -o tags {} \;'

# Add directories to a history file. I intend to use this file to establish a
# path history to determine where I go.
#alias cd='pwd >> ~/.dirhistory; cd '

# ls immediately after changing directories.
function cd { builtin cd "$@" && ls -F; }

################################################################################
#
#                                     HISTORY
#
################################################################################
export HISTCONTROL=erasedups
export HISTTIMEFORMAT='%F %T  '
export HISTIGNORE='ls -l:pwd:date:'

################################################################################
#
#                                      PATH
#
################################################################################
export PATH="$HOME/.cargo/bin:/home/paul/.yarn/bin:$PATH"

