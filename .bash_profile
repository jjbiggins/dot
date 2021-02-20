#################################################################
#                                                               #
#   .bash_profile file                                          #
#                                                               #
#   Executed from the bash shell when you log in.               #
#                                                               #
#################################################################


source ~/.profile

if [[ -f  ~/.bash_login ]]; then
    . ~/.bash_login
fi


if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi



#source ~/.functions
# local usr bin dir, use only for user currently logged in
#PATH=$HOME/.bin:$PATH
#export $PATH


# Your previous /Users/jjbiggins/.bash_profile file was backed up as /Users/jjbiggins/.bash_profile.macports-saved_2020-11-19_at_18:19:06
##

# MacPorts Installer addition on 2020-11-19_at_18:19:06: adding an appropriate PATH variable for use with MacPorts.


# MacPorts Installer addition on 2020-11-19_at_18:19:06: adding an appropriate DISPLAY variable for use with MacPorts.
# Finished adapting your DISPLAY environment variable for use with MacPorts.


function gam() { "/Users/jjbiggins/bin/gam/gam" "$@" ; }
