# Executed by bash(1) for non-login shells.

# For unlimited history length.
HISTSIZE="-1"
# Enable history appending
shopt -s histappend
# Function to update HISTFILE based on current directory
function update_histfile {
    local dir_name=$(echo "$PWD" | tr '/' '%')
    export HISTFILE="$HOME/.bash_history/$dir_name"
}
# Initially set HISTFILE when the shell starts
update_histfile
# Update HISTFILE when the directory changes
function chpwd {
    update_histfile
}
# Ensure chpwd is called whenever the prompt is displayed
PROMPT_COMMAND="history -a; history -n; chpwd; $PROMPT_COMMAND"
# Set HISTCONTROL to ignore duplicates and commands starting with a space
export HISTCONTROL="ignoreboth"

# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null && [[ $TERM =~ color ]]; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# If this is an xterm set the title to user@host:dir,
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Colored GCC warnings and errors.
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Any executables in that location should take precedence.
PATH="$HOME/.local/bin:$PATH"

# Some more aliases.
if [[ -n $(type -P gvim) ]]; then
        alias vi='gvim -p'
elif [[ -n $(type -P vim) ]]; then
        alias vi='vim -p'
fi
