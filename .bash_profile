#################################################################
#                                                               #
#   .bash_profile file                                          #
#                                                               #
#   Executed from the bash shell when you log in.               #
#                                                               #
#################################################################

# ====================================================================
# User PATH Settings
# ===================================================================
PATH="/opt/local/bin:/opt/local/sbin:$PATH"

PATH="/Users/jjbiggins/Library/Python/3.9/bin:$PATH"
PATH="/opt/local/libexec/gnubin:$PATH"

# Personal Script Binaries
PATH="/Users/jjbiggins/bin:$PATH"



# ----------------------------------------------------------------
# Silences macOS warning about zsh not being shell
# ----------------------------------------------------------------
export BASH_SILENCE_DEPRECATION_WARNING=1



# ===============================================================
# Source other bash files
# ===============================================================
if [[ -f ~/.profile ]]; then
	. ~/.profile
fi


if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi


if [[ -f  ~/.bash_login ]]; then
    . ~/.bash_login
fi

if [[ -f ~/.functions ]]; then
    source  ~/.functions
fi

if [[ -f ~/.iterm2_shell_integration.bash ]]; then
	source ~/.iterm2_shell_integration.bash
fi

# --------------------------------------------------------------
# Set Mail Directory
# --------------------------------------------------------------
export MAIL=/var/mail/jjbiggins		


# --------------------------------------------------------------
# X11 window system
# --------------------------------------------------------------
#export DISPLAY=localhost.localdomain:0.0

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


#source ~/.functions
# local usr bin dir, use only for user currently logged in
#PATH=$HOME/.bin:$PATH
#export $PATH

function gam() { "/Users/jjbiggins/bin/gam/gam" "$@" ; }

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true


# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH
[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
