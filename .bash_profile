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


# MacPorts Installer addition on 2022-09-21_at_03:27:38: adding an appropriate PATH variable for use with MacPorts.
export PATH="$PATH:/opt/local/bin:/opt/local/sbin"


# Added by Toolbox App
export PATH="$PATH:/Users/jjbiggins/Library/Application Support/JetBrains/Toolbox/scripts"


if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi



PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/jjbiggins/Applications/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/jjbiggins/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/jjbiggins/Applications/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/jjbiggins/Applications/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

