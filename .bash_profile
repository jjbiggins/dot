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



if [ -r ~/.profile ]; then . ~/.profile; fi


# Added by install_latest_perl_osx.pl
#case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac


if [[ -f  ~/.bash_login ]]; then
    . ~/.bash_login
fi


if [[ -f ~/.iterm2_shell_integration.bash ]]; then
	source ~/.iterm2_shell_integration.bash
fi


# OLD macports -- source bash completeions
#if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
#    . /opt/local/etc/profile.d/bash_completion.sh
#fi


#============================================================
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#+ be converted into scripts and removed from here.
#
#============================================================

# Source aliases in alias file
if [ -f ~/.bashrc_aliases ]; then
    . ~/.bashrc_aliases
fi


# Developer Directory
DEVELOPER_DIR="$(xcode-select --print-path)"; export DEVELOPER_DIR
MACOS_SDK="$(xcrun --show-sdk-path)"; export MACOS_SDK
export JAVA_HOME=$(/usr/libexec/java_home)

PATH="/opt/apache-maven-3.8.6/bin:$PATH"
PATH="${DEVELOPER_DIR}/usr/bin:$PATH"
PATH="${MACOS_SDK}/usr/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH
