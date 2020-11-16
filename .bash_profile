
franky~> cat .bash_profile
#################################################################
#                                                               #
#   .bash_profile file                                          #
#                                                               #
#   Executed from the bash shell when you log in.               #
#                                                               #
#################################################################

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.bash_login ]; then
	. ~/.bash_login
fi

case "$OS" in
  IRIX)
    stty sane dec
    stty erase
    ;;
#  SunOS)
#    stty erase
#    ;;
  *)
    stty sane
    ;;
esac



##
# Your previous /Users/jjbiggins/.bash_profile file was backed up as /Users/jjbiggins/.bash_profile.macports-saved_2020-11-16_at_06:31:54
##

# MacPorts Installer addition on 2020-11-16_at_06:31:54: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2020-11-16_at_06:31:54: adding an appropriate DISPLAY variable for use with MacPorts.
export DISPLAY=:0
# Finished adapting your DISPLAY environment variable for use with MacPorts.

# ~/.dircolors/themefile
eval $(gdircolors ~/.dircolors/dircolors.256dark)

# Aliases
alias ls='gls --color=auto'
alias ll='ls -al'

