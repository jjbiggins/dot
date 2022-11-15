#!/bin/bash



[ -z "$PS1" ] && return

# -------------------------------------------------------------
# Sourcing system bashrc, because always comes first
# -------------------------------------------------------------
if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

export EDITOR=vim
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

LESSOPEN="|/usr/local/bin/lesspipe.sh %s"; export LESSOPEN

# -------------------------------------------------------------
# Time and History settings
# -------------------------------------------------------------
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'

# History
#export HISTIGNORE="&:bg:fg:ll:h"
export HISTIGNORE="history*"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
export HISTCONTROL=ignoredups
export HISTFILESIZE=10000000000000
#export HISTFILE=$HOME/.history

#-------------------------------------------------------------
# The Shopt Builtin
#-------------------------------------------------------------
# Enable options:
shopt -s cdspell					# cd with minor spell err
shopt -s cdable_vars					# auto cd vars 
shopt -s checkhash					# check is hashed cmd exist
shopt -s checkwinsize					# check window size 
shopt -s sourcepath					# path is same as cmd arg
shopt -s no_empty_cmd_completion			# no completion when read line
shopt -s cmdhist					# generates a cmd history
shopt -s histappend					# cmds appended to history
shopt -s extglob					# Enables globbing
shopt -u mailwarn					# show Got mail warning 


#PROMPT_COMMAND="history -a"
export LESSCHARSET='utf-8'
if type lesspipe.sh >/dev/null 2>&1; then
    export LESSOPEN='|lesspipe.sh %s'
fi

# Use this if lesspipe.sh exists.
export LESSOPEN='|/usr/local/bin/lesspipe.sh %s 2>&-'          
export TERMINFO=/usr/share/terminfo


# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

if type pygmentize >/dev/null 2>&1; then
  export LESSCOLORIZER='pygmentize'
fi



#=========================================================================
#
#  PROGRAMMABLE COMPLETION SECTION
#  Most are taken from the bash 2.05 documentation and from Ian McDonald's
# 'Bash completion' package (http://www.caliban.org/bash/#completion)
#  You will in fact need bash more recent then 3.0 for some features.
#
#  Note that most linux distributions now provide many completions
# 'out of the box' - however, you might need to make your own one day,
#  so I kept those here as examples.
#=========================================================================

if [[ -f ~/.direnvvars ]]; then
    source ~/.direnvvars
fi

if [ "${BASH_VERSION%.*}" \< "3.0" ]; then
    echo "You will need to upgrade to version 3.0 for full \
          programmable completion features"
    return
fi


if [[ -f ~/.functions ]]; then
    source  ~/.functions
fi


# MacPorts Installer addition on 2022-09-21_at_03:27:38: adding an appropriate PATH variable for use with MacPorts.
export PATH="$PATH:/opt/local/bin:/opt/local/sbin"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Developer Directory
DEVELOPER_DIR="$(xcode-select --print-path)"; export DEVELOPER_DIR

# macOS SDK
MACOS_SDK="$(xcrun --show-sdk-path)"; export MACOS_SDK

# java_home
JAVA_HOME=$(/usr/libexec/java_home); export JAVA_HOME


# PATH
PATH="${PATH}:${DEVELOPER_DIR}/usr/bin"
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"

# export everything
export DEVELOPER_DIR
export JAVA_HOME
export PATH

export CERT_PATH=$(python3 -m certifi)
export SSL_CERT_FILE=${CERT_PATH}
export REQUESTS_CA_BUNDLE=${CERT_PATH}


# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
