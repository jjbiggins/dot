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


# Finished adapting your PATH environment variable for use with MacPorts.


# Added by Toolbox App
export PATH="$PATH:/Users/jjbiggins/Library/Application Support/JetBrains/Toolbox/scripts"



if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jjbiggins/Applications/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jjbiggins/Applications/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jjbiggins/Applications/miniconda3/etc/profile.d/conda.sh"
    else
        PATH="$PATH:/Users/jjbiggins/Applications/miniconda3/bin"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


PATH="/opt/private/bin:$PATH"
export PATH

