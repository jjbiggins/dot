# ===================================================================
# BASH SHELL FILES 
# -------------------------------------------------------------------
# SOURCES:
#   1. ~/.bash_profile sources ~/.bashrc
# 
# ABOUT:
#   ~/.bash_profile -- login shell only, source other shell files
#   ~/.bashrc -- sets PS1, shell options (shopts), etc.
# ====================================================================


export BASH_SILENCE_DEPRECATION_WARNING=1





if [[ -f ~/.bash_login ]]; then
	. ~/.bash_login
fi

# Added by install_latest_perl_osx.pl
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

#if [[ -f ~/.bashrc ]]; then
#    . ~/.bashrc
#fi



# git autocomplete
source ~/.git-completion.bash


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







##case "$TERM_PROGRAM" in 
#	*Apple_Terminal*)
#		TERM=xterm
#		;;
#	*tmux*)
#		TERM=xterm
#		;;
#	*iTerm*)
#		TERM=xterm
#		;;
#	*)
#		TERM=xterm
#		;;
#esac


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


PATH="${PATH}:/Applications/Xcode.app/Contents/Developer/usr/bin"

. "$HOME/.cargo/env"


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


# NVM (node version management)
if [[ -d "${HOME}/.nvm" ]]; then
    # nvm path
    export NVM_DIR="${HOME}/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi




if [[ -d '/opt/local' ]]; then 
    # add macports to path if installed
    PATH="${PATH}:/opt/local/bin:/opt/local/sbin"
elif [[ -d '/opt/pkg' ]]; then
    # add pkgsrc to path if installed
    PATH="${PATH}:/opt/pkg/bin:/opt/pkg/sbin"
fi

# Homebrew
HOMEBREW_CASK_OPTS="--appdir=/Applications"

PATH="${PATH}:/opt/homebrew/bin"
PATH="${PATH}:/opt/homebrew/sbin"

# homebrew binutils
if [[ -d "/opt/homebrew/opt/binutils" ]]; then
    PATH="/opt/homebrew/opt/binutils/bin:${PATH}"
    PATH="/opt/homebrew/opt/binutils/aarch64-apple-darwin22.4.0/bin:${PATH}"
fi


if [[ $(uname -s) == "Darwin" ]]; then
    DEVELOPER_DIR=$(xcode-select --print-path)
    MACOSX_SDK_PATH=$(xcrun --show-sdk-path)
    PATH="${MACOSX_SDK_PATH}/usr/bin:${PATH}"
fi


SSL_CERT_FILE=$(python3 -m certifi) 

# anaconda
#eval "$(register-python-argcomplete conda)"

# Java now appears to come installed on macOS by default
# JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# PATH="${JAVA_HOME}/bin:${PATH}"


PATH="${PATH}:/opt/homebrew/opt/coreutils/libexec/gnubin"
PATH="${PATH}:/opt/apache-maven-3.9.4/bin"; export PATH
PATH="/opt/homebrew/opt/libxml2/bin:$PATH"

# Homebrew Envvars
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_ANALYTICS=1

# huggingface-cli environment variables
export HF_HUB_DISABLE_TELEMETRY=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(rbenv init - bash)"

# Setting PATH for Python 3.12
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"

# >>> coursier install directory >>>
export PATH="$PATH:/Users/jjbiggins/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

# OpenXLA - StableHLO 
# Set the LLVM_ENABLE_LLD shell variable depending on your preferences. 
# We recommend setting it to ON on Linux and to OFF on macOS.
[[ "$(uname)" != "Darwin" ]] && LLVM_ENABLE_LLD="ON" || LLVM_ENABLE_LLD="OFF"


export WASMTIME_HOME
export JAVA_HOME
export CERT_PATH
export SSL_CERT_FILE
export REQUESTS_CA_BUNDLE
export PATH


. "$HOME/.local/bin/env"

# Setting PATH for Python 3.14
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.14/bin:${PATH}"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :

# Added by Antigravity
export PATH="/Users/jjbiggins/.antigravity/antigravity/bin:$PATH"

export PATH
