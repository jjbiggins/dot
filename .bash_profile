# ===================================================================
# BASH SHELL FILES 
# -------------------------------------------------------------------
# SOURCES:
#   1. ~/.bash_profile sources ~/.profile
#   2. ~/.profile sources ~/.bashrc
# 
# ABOUT:
#   ~/.bash_profile -- the driver, source all other shell init file
#   ~/.profile -- sources ~/.bashrc if interactive, sets envvars
#   ~/.bashrc -- sets PS1, shell options (shopts), etc.
# ====================================================================


export BASH_SILENCE_DEPRECATION_WARNING=1
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/opt/local/share/pkgconfig"

# PS1 Colors
BRIGHT_GREEN=$'\033[01;32m'
LIGHT_BLUE=$'\033[00;34m'
NC=$'\033[00;00m'


# Added by install_latest_perl_osx.pl
# case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

if [[ -f ~/.bash_login ]]; then
	. ~/.bash_login
fi


if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi


if [[ -f ~/.iterm2_shell_integration.bash ]]; then
	source ~/.iterm2_shell_integration.bash
fi


#============================================================
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#+ be converted into scripts and removed from here.
#
#============================================================
if [ -f ~/.bashrc_aliases ]; then
    . ~/.bashrc_aliases
fi


if [[ -f ~/.functions ]]; then
    source  ~/.functions
fi




if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then

	echo "${SUDO_USER} ${SUDO_PS1}"
	PS1_SUFFIX="\[ ${NC}\]:\[${LIGHT_BLUE}\]\W\[${NC}\]]\$ "
	
	if [ "$(uname -s)" == "Linux" ]; then 
		LINUX_ONLY='[${debian_chroot:+($debian_chroot)}\[\033[01;32m\]' 
	fi

	PS1_VARS='\h'	
	if [[ "${USER}" != "jjbiggins" || $(hostname -s) != "master" ]]; then
	    PS1_USER=${PS1_USER:-'\u'}
	fi

	#
	# Example PS1:
	#PS1='[\033[01;32m\]\h\[\033[00m\]:\[\033[00;34m\]\W\[\033[00m\]]$ '
	#
	#PS1='[${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[00;34m\]\W\[\033[00m\]]\$ '
	echo ${PS1_USER}
	PS1="[${PS1_USER}\${BRIGHT_GREEN}\]${PS1_VARS}\[${NC}\]:\[${LIGHT_BLUE}\]\W\[${NC}\]]$ "

fi




case "$TERM_PROGRAM" in 
	*Apple_Terminal*)
		TERM=xterm
		;;
	*tmux*)
		TERM=xterm
		;;
	*iTerm*)
		TERM=xterm
		;;
	*)
		TERM=xterm
		;;
esac


# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
case "$TERM" in
	*xterm*|rxvt*)
	
	# Xterm:
	# ESC]0;stringBEL — Set icon name and window title to string
	# ESC]1;stringBEL — Set icon name to string
	# ESC]2;stringBEL — Set window title to strings 
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
	;;
*tmux*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
	;;
*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
	;;
esac


USER_PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }${USER_PROMPT_COMMAND}"



if [[ $(uname -s) == "Darwin" ]]; then

    PYTHON_VERS_DIR="/Library/Frameworks/Python.framework/Versions"
    
    if [[ -d "${PYTHON_VERS_DIR}/3.8" ]]; then
	# Setting PATH for Python 3.8
	# The original version is saved in .bash_profile.pysave
	PATH="${PYTHON_VERS_DIR}/3.8/bin:${PATH}"
    fi

    if [[ -d "${PYTHON_VERS_DIR}/3.9" ]]; then
	# Setting PATH for Python 3.9
	# The original version is saved in .bash_profile.pysave
	PATH="${PYTHON_VERS_DIR}/3.9/bin:${PATH}"
    fi

    if [[ -d "${PYTHON_VERS_DIR}/3.7" ]]; then
	# Setting PATH for Python 3.7
	# The original version is saved in .bash_profile.pysave
	PATH="${PYTHON_VERS_DIR}/3.7/bin:${PATH}"
    fi
   
    if [[ -d "${PYTHON_VERS_DIR}/3.11" ]]; then
       	# Setting PATH for Python 3.11
	# The original version is saved in .bash_profile.pysave
	PATH="${PYTHON_VERS_DIR}/3.11/bin:${PATH}"
    fi
fi


# Setting PATH for gradle 7.6
#PATH="/opt/gradle/gradle-7.6/bin:${PATH}"

if [[ -d "${HOME}/.wasmtime" ]]; then
    WASMTIME_HOME="$HOME/.wasmtime"
    PATH="$WASMTIME_HOME/bin:$PATH"
fi


if [[ -d "/opt/wasi-sdk" ]]; then
    WASI_SDK_PATH="/opt/wasi-sdk"
    PATH="${PATH}:${WASI_SDK_PATH}/bin"
fi


if [[ $(uname -s) == "Darwin" ]]; then
    PATH="${PATH}:${HOME}/.dat/releases/dat-14.0.2-macos-x64"
fi


if [[ $(uname -s) == "Darwin" ]]; then
    PATH="${PATH}:${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"
fi

# Andriod home envvars
if [[ $(uname -s) == "Darwin" && -d "${HOME}/Library/Android" ]]; then
    ANDRIOD_HOME="${HOME}/Library/Android/sdk"
    PATH="${PATH}:${ANDRIOD_HOME}/tools"
    PATH="${PATH}:${ANDRIOD_HOME}/tools/bin"
    PATH="${PATH}:${ANDRIOD_HOME}/platform-tools"
fi

if [[ -d "${HOME}/.nvm" ]]; then
    # nvm path
    export NVM_DIR="${HOME}/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi


if [[ -d "${HOME}/.yarn" || -f "${HOME}/.yarnrc" ]]; then
    PATH="${PATH}:$(yarn global bin)"
fi

# set java_home
if  [[ $(uname -s) == "Darwin" ]]; then
    JAVA_HOME="$(/usr/libexec/java_home -v 17)" 
elif [[ $(uname -s) == "Linux" ]]; then
    JAVA_HOME=$(readlink -f /etc/alternatives/java | sed -e 's/\/bin\/java//g')
fi

# add JAVA_HOME/bin to PATH
if [[ !  -z "${JAVA_HOME}" ]]; then
    PATH="${JAVA_HOME}/bin:${PATH}" 
fi


if [[ -d '/opt/local' ]]; then 
    # add macports to path if installed
    PATH="${PATH}:/opt/local/bin:/opt/local/sbin"
elif [[ -d '/opt/pkg' ]]; then
    # add pkgsrc to path if installed
    PATH="${PATH}:/opt/pkg/bin:/opt/pkg/sbin"
fi


if [ !  -z "$PYTHONPATH" ]; then
 	CERT_PATH=$(python3 -m certifi)
	SSL_CERT_FILE=${CERT_PATH}
	REQUESTS_CA_BUNDLE=${CERT_PATH}
fi



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/jjbiggins/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/jjbiggins/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/jjbiggins/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/jjbiggins/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<



if [[ -d "${HOME}/.rbenv" ]]; then
    eval "$(rbenv init - bash)"
fi

#if [[ -d "${HOME}/.docker" ]]; then
#    source "${HOME}/.docker/init-bash.sh" || true # Added by Docker Desktop
#fi


export ANDRIOD_HOME
export WASMTIME_HOME
export JAVA_HOME
#export PYTHONPATH
export CERT_PATH
export SSL_CERT_FILE
export REQUESTS_CA_BUNDLE
export DEVELOPER_DIR
export PATH


