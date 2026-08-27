#!/bin/bash

# test if $PS1 is unset
# If shell is not interactive, stop processing this file
[ -z "$PS1" ] && return


# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
        . /usr/share/bash-completion/bash_completion


#-------------------------------------------------------------
# source global definitions (if any)
#-------------------------------------------------------------
if [ -f /etc/bashrc ]; then
          . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi


if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi



# Settings
set -o notify
set -o noclobber
set -o ignoreeof

# The Shopt Builtin
shopt -s cdspell	    # cd works with  minor spell errs
			    # Ex: cd Documnts would work
			    
shopt -s cdable_vars	    # can set path to variable and cd into into
			    # Ex: projects=~/work/projects; cd projects

shopt -s checkhash	    # bash caches command locations
			    # will check whether cached executable exists before using in

shopt -s checkwinsize	    # automatically refreshes $LINES and $COLUMNS

shopt -s sourcepath	    # allows source to search $PATH
			    # source script.sh works would need source ./script.sh without it set

shopt -s no_empty_cmd_completion    # TAB does nothing on empty line

shopt -s cmdhist	    # store multi line cmds as single entry in history

shopt -s extglob	    # Enables extended globbing. Powerful feature

shopt -s mailwarn	    # warn if mail file changed but not read


shopt -s histappend	    # cmds appended to history
shopt -u progcomp	    # allows completion - extending completions

# Color Definitions

# PS1 Colors
BRIGHT_GREEN=$'\033[01;32m'
LIGHT_BLUE=$'\033[00;34m'
NC=$'\033[01;00m'
#NC=$'\e[0;00m'		 # Color reset

# Normal Colors
Black=$'\e[0;30m'        # Black
Red=$'\e[0;31m'          # Red
Green=$'\e[0;32m'        # Green
Yellow=$'\e[0;33m'       # Yellow
Blue=$'\e[0;34m'         # Blue
Purple=$'\e[0;35m'       # Purple
Cyan=$'\e[0;36m'         # Cyan
White=$'\e[0;37m'        # White

# Bold
BBlack=$'\e[1;30m'       # Black
BRed=$'\e[1;31m'         # Red
BGreen=$'\e[1;32m'       # Green
BYellow=$'\e[1;33m'      # Yellow
BBlue=$'\e[1;34m'        # Blue
BPurple=$'\e[1;35m'      # Purple
BCyan=$'\e[1;32m'        # Cyan
BWhite=$'\e[1;37m'       # White

# Background
On_Black=$'\e[40m'       # Black
On_Red=$'\e[41m'         # Red
On_Green=$'\e[42m'       # Green
On_Yellow=$'\e[43m'      # Yellow
On_Blue=$'\e[44m'        # Blue
On_Purple=$'\e[45m'      # Purple
On_Cyan=$'\e[46m'        # Cyan
On_White=$'\e[47m'       # White

# Bold White on red background
ALERT=${BWhite}${On_Red} 


if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
	#
	# Example PS1:
	PS1_USER=[${NC}\\]\\u
	PS1_HOST=[${BRIGHT_GREEN}\\]\\h\\[${NC}\\]
	PS1_CURDIR=[${LIGHT_BLUE}\\]\\W\\[${NC}\\]
	
	if [[ "${USER}" != "jjbiggins" || $(hostname -s) != "master" ]]; then
	    PS1='[\'"${PS1_USER}"'@\'"${PS1_HOST}"':\'"${PS1_CURDIR}"']$ ' 
	else
	    PS1='[\'"${PS1_HOST}"':\'"${PS1_CURDIR}"']$ ' 
	fi
fi


echo -e "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}\
    - DISPLAY on ${BRed}$DISPLAY${NC}\n"
date


_exit() {
    # Function to run upon exit of shell.
    echo -e "${BRed}Hasta la vista, baby${NC}"
}
trap _exit EXIT




# Test connection type:
if [ -n "${SSH_CONNECTION}" ]; then
    CNX=${Green}	# Connected on remote machine, via ssh (good).
elif [[ "${DISPLAY%%:0*}" != "" ]]; then
    CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
else
    CNX=${BCyan}        # Connected on local machine.
fi


# Test user type:
if [[ ${USER} == "root" ]]; then
    SU=${Red}           # User is root.
elif [[ ${USER} != $(logname) ]]; then
    SU=${BRed}          # User is not login user.
else
    SU=${BCyan}         # User is normal (well ... most of us are).
fi

# Number of CPUs
if [[ $(uname -s) == "Darwin" ]]; then
    NCPU=$(sysctl -n hw.ncpu)	
elif [[ $(uname -s) == "Linux" ]]; then
    NCPU=$(grep 'cpu cores' /proc/cpuinfo | uniq | \
	    cut -d':' -f2 | tr -d ' ')	
fi 

SLOAD=$(( 100*${NCPU} ))        # Small load
MLOAD=$(( 200*${NCPU} ))        # Medium load
XLOAD=$(( 400*${NCPU} ))        # Xlarge load



PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# Time and History settings
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m/%Y %H:%M:%S %Z]$(echo -e ${NC}) "
export HISTCONTROL=ignoredups
export HISTSIZE=10000000000

# remote hosts
export HOSTFILE=${HOME}/.hosts

# default editor
export EDITOR=vim


# pager configurations
export PAGER=less
export MANWIDTH=60

export LESSCHARSET='utf-8'
export LESSOPEN='|lesspipe.sh %s'

# add -N flag to enable line numbers in manpages
export LESS='-i --line-num-width=1 -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
    :stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

if type pygmentize >/dev/null 2>&1; then
  export LESSCOLORIZER='pygmentize'
fi



# (OSX and BSD only) ls and grep envvars
if [[ $(uname -s) == "Darwin" ]]; then
    export GREP_OPTIONS='--color=always'
    export CLICOLOR=1
fi



if [ "${BASH_VERSION%.*}" \< "3.0" ]; then
    echo "You will need to upgrade to version 3.0 for full \
          programmable completion features"
    return
fi


# Apple Developer Directory
if [[ $(uname -s) == "Darwin" ]]; then
    if [ -d "$(xcode-select --print-path)" ]; then
	DEVELOPER_DIR="$(xcode-select --print-path)"; export DEVELOPER_DIR
	MACOS_SDK="$(xcrun --show-sdk-path)"; export MACOS_SDK
    fi
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
export SP_HOME=/Users/jjbiggins/streampipes
export PATH=$PATH:$SP_HOME
. "$HOME/.cargo/env"


. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"


# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
